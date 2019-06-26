module Followees
  class SyncArticlesJob < ::ApplicationJob
    queue_as :default

    JOB_FREQUENCY = 10.minutes

    def perform
      to_datetime = ::DateTime.current
      from_datetime = to_datetime - JOB_FREQUENCY
      followees.each do |followee|
        SyncArticlesService.new(followee: followee).sync_articles(
          from_datetime: from_datetime.to_s,
          to_datetime: to_datetime.to_s
        )
      end
    end

    protected
      def followees
        ::Followee.all()
      end
  end
end
