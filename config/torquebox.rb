TorqueBox.configure do
  # set a var so that app code can know if TorqueBox features are available.
  environment do
    IS_TORQUEBOX true
  end

  # By default, Backgroundable tasks are durable (queued tasks will persist between
  # server restarts) and processing has a concurrency of 1 (single-threaded).
  # Increasing concurrency keeps a single slow job from blocking on all other apps.
  options_for Backgroundable, :concurrency => 3

  # process incoming JMS messages from activeMQ
  # CALCENTRAL-ONLY
  service JmsWorker

  # Check the health of the background-job processor and the cache.
  service BackgroundJobsCheck
  topic '/topics/background_jobs_check' do
    durable false
    processor BackgroundJobsCheck
  end

  # Reload settings from YAML across clusters.
  topic '/topics/settings_reload' do
    durable false
    processor SettingsReloadWorker
  end

end

