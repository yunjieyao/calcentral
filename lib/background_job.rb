module BackgroundJob
  # Provides background job states for background job workers
  #
  # Usage Example:
  #
  #   def MyClass
  #     include BackgroundJob
  #
  #     def initialize
  #       background_job_set_type('something_awesome')
  #       background_job_set_total_steps(2)
  #     end
  #
  #     def perform_work
  #       # do step one
  #       if (error)
  #         background_job_add_error('Something went wrong')
  #         return false
  #       end
  #       background_job_complete_step('First step completed')
  #
  #       # do step two
  #       background_job_complete_step('Second step completed')
  #     end
  #
  #     # Returns custom hash merged into background job reports
  #     def background_job_report_custom
  #       {:customKey => @custom_value}
  #     end
  #   end
  #
  #   worker = MyClass.new(:course_id => course_id)
  #   worker.background_job_initialize(:job_type => 'special_job', :total_steps => 3)
  #   worker.background_correlate(worker.background.perform_work)
  #
  include BackgroundableShim
  include ClassLogger

  attr_reader :background_job_id

  def self.unique_job_id
    15.times do
      cache_key_candidate = "#{DateTime.now.to_s}-#{SecureRandom.hex(8)}"
      return cache_key_candidate if Rails.cache.read(cache_key_candidate).nil?
    end
    raise RuntimeError, 'Unable to find unique Background Job ID'
  end

  def self.find(cache_key)
    Rails.cache.fetch cache_key
  end

  def background
    # By default, Torquebox keeps task state changes and completed tasks in the queue
    # for 10 minutes, so that tardy clients have a chance to check their associated
    # TorqueBox::Messaging::Future objects. Our code doesn't rely on long-running
    # parent threads, and so we can dispose with the noise.
    super(future_ttl: 5000)
  end

  def background_job_initialize(options = {})
    default_options = {
      :job_type => '',
      :total_steps => 1,
    }
    options.reverse_merge!(default_options)

    @background_job_id = "#{self.class.name}.#{BackgroundJob.unique_job_id}"
    @background_job_id += ".#{options[:job_type]}" unless options[:job_type].blank?
    @background_job_type = options[:job_type]
    @background_job_total_steps = options[:total_steps]
    @background_job_status = 'New'
    @background_job_errors = []
    @background_job_report_custom = {}
    @background_job_completed_steps = []
    background_job_save
  end

  # Overridden by class. Provides hash merged into background job report hash
  def background_job_report_custom
    Hash.new
  end

  def background_job_report
    report = {
      jobId: @background_job_id,
      jobType: @background_job_type,
      jobStatus: @background_job_status,
      completedSteps: @background_job_completed_steps,
      percentComplete: (@background_job_completed_steps.count.to_f / @background_job_total_steps.to_f).round(2),
    }
    report[:errors] = @background_job_errors if @background_job_errors.count > 0
    report.reverse_merge!(background_job_report_custom)
    report[:correlation_id] = Rails.cache.fetch correlation_cache_key
    report
  end

  def correlation_cache_key
    @background_job_id + '.Correlation'
  end

  def background_correlate(backgroundable_future)
    torquebox_correlation_id = backgroundable_future.respond_to?(:correlation_id) ? backgroundable_future.correlation_id : nil
    logger.warn "background_job_id = #{@background_job_id}, Torquebox correlation_id = #{torquebox_correlation_id}"
    Rails.cache.write(correlation_cache_key, torquebox_correlation_id, expires_in: Settings.cache.expiration.CanvasBackgroundJobs)
    backgroundable_future
  end

  def background_job_set_type(type)
    @background_job_type = type
    background_job_save
  end

  def background_job_save
    Rails.cache.write(@background_job_id, self, expires_in: Settings.cache.expiration.CanvasBackgroundJobs)
  end

  def background_job_set_total_steps(total_steps)
    @background_job_total_steps = total_steps.to_i
    background_job_save
  end

  def background_job_add_error(error)
    @background_job_errors << error
    @background_job_status = 'Error'
    background_job_save
  end

  def background_job_complete_step(step_text = '')
    @background_job_completed_steps << step_text
    if @background_job_status != 'Error'
      completed_steps = @background_job_completed_steps.count
      @background_job_status = 'Processing' if (completed_steps > 0) || (completed_steps < @background_job_total_steps)
      @background_job_status = 'Completed' if (completed_steps >= @background_job_total_steps)
    end
    background_job_save
  end

end
