module DegreeProgress
  module MilestonesModule
    include DatedFeed

    CAREER_LAW = 'LAW'
    ACAD_PROG_CODE_LACAD = 'LACAD'

    def process(response)
      degree_progress = response.try(:[], :feed).try(:[], :ucAaProgress).try(:[], :progresses)
      massage_progresses(degree_progress)
    end

    def massage_progresses(degree_progress)
      result = []
      if !!degree_progress
        degree_progress.each do |progress|
          if should_exclude progress
            next
          end
          progress[:requirements] = normalize(progress.fetch(:requirements))
          result.push(progress) unless progress[:requirements].blank?
        end
      end
      result
    end

    def should_exclude(progress)
      CAREER_LAW == progress[:acadCareer] && ACAD_PROG_CODE_LACAD != progress[:acadProgCode]
    end

    def normalize(requirements)
      normalized_requirements = requirements.map do |requirement|
        name = Berkeley::GraduateMilestones.get_description(requirement[:code])
        if name
          normalized = {
            name: name,
            code: requirement[:code],
            status:  parse_status(requirement),
            orderNumber: Berkeley::GraduateMilestones.get_order_number(requirement[:code]),
            dateCompleted: parse_date(requirement[:dateCompleted]),
            dateAnticipated: parse_date(requirement[:dateAnticipated]),
            formNotification: Berkeley::GraduateMilestones.get_form_notification(requirement[:code], requirement[:status]),
            attempts: parse_milestone_attempts(requirement)
          }
          normalized[:statusCode] = determine_status_code(requirement[:status], normalized[:attempts])
          normalized
        end
      end.compact
      set_proposed_exam_date(normalized_requirements)
      normalized_requirements
    end

    def parse_status(requirement)
      Berkeley::GraduateMilestones.get_status(requirement[:status], requirement[:code]) || Berkeley::GraduateMilestones::STATUS_INCOMPLETE
    end

    def parse_date(date)
      pretty_date = ''
      begin
         pretty_date = format_date(strptime_in_time_zone(date, '%F'), '%b %d, %Y')[:dateString] unless date.blank?
      rescue
        logger.error "Bad date format: #{date} in class #{self.class.name}, uid = #{@uid}"
      end
      pretty_date
    end

    def parse_milestone_attempts(requirement)
      qualifying_exam_attempts = []
      if qualifying_exam?(requirement)
        qualifying_exam_attempts = requirement[:attempts].try(:map) do |attempt|
          parse_milestone_attempt(attempt)
        end
        qualifying_exam_attempts.try(:sort_by!) do |attempt|
          attempt[:sequenceNumber]
        end.try(:reverse!)
      end
      qualifying_exam_attempts
    end

    def qualifying_exam?(requirement)
      requirement[:code].to_s.strip.upcase === Berkeley::GraduateMilestones::QE_RESULTS_MILESTONE
    end

    def parse_milestone_attempt(milestone_attempt)
      attempt_result = Berkeley::GraduateMilestones.get_status(milestone_attempt[:attemptStatus], Berkeley::GraduateMilestones::QE_RESULTS_MILESTONE)
      sequence_number = milestone_attempt[:attemptNbr].to_i
      {
        sequenceNumber: sequence_number,
        statusCode: milestone_attempt[:attemptStatus],
        display: "Exam #{sequence_number}: #{attempt_result} #{parse_date(milestone_attempt[:attemptDate])}"
      }
    end

    def determine_status_code(status_code, milestone_attempts)
      return status_code unless status_code.blank?
      latest_attempt = milestone_attempts.first unless milestone_attempts.blank?
      latest_attempt.try(:[], :statusCode)
    end

    def set_proposed_exam_date(requirements)
      qualifying_exam_approval_milestone = requirements.select do |requirement|
        requirement.try(:[], :code) === Berkeley::GraduateMilestones::QE_APPROVAL_MILESTONE
      end.first
      if qualifying_exam_approval_milestone.try(:[], :statusCode) === Berkeley::GraduateMilestones::STATUS_CODE_COMPLETE
        qualifying_exam_results_milestone = requirements.select do |requirement|
          requirement.try(:[], :code) === Berkeley::GraduateMilestones::QE_RESULTS_MILESTONE
        end.first
        exam_attempted = qualifying_exam_results_milestone.try(:[], :attempts).present?
        qualifying_exam_approval_milestone[:proposedExamDate] = qualifying_exam_approval_milestone.try(:[], :dateAnticipated) unless exam_attempted
      end
    end
  end
end
