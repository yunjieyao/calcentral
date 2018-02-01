module MyAcademics
  class MyHolds < UserSpecificModel
    include Cache::CachedFeed
    include Cache::JsonifiedFeed
    include Cache::UserCacheExpiry

    def get_feed_internal
      academic_status = HubEdos::AcademicStatus.new({user_id: @uid}).get
      {
        feed: {
          holds: parse_holds(academic_status)
        },
        errored: academic_status.try(:[], :errored),
        statusCode: academic_status.try(:[], :statusCode)
      }
    end

    def parse_holds(academic_status)
      hub_response = academic_status.try(:[], :feed).try(:[], 'student').try(:[], 'holds') || []
      hub_response.map do |hub_hold|
        {
          :reason => {
            :description => hub_hold.try(:[], 'reason').try(:[], 'description'),
            :formalDescription => hub_hold.try(:[], 'reason').try(:[], 'formalDescription')
          },
          :amountRequired => hub_hold.try(:[], 'amountRequired'),
          :fromDate => hub_hold.try(:[], 'fromDate'),
          :fromTerm => {
            :name => hub_hold.try(:[], 'fromTerm').try(:[], 'name')
          },
          :contact => {
            :description => hub_hold.try(:[], 'contact').try(:[], 'description')
          }
        }
      end
    end
  end
end
