module Followees
  class SyncArticlesJob < ::ApplicationJob
    queue_as :default

    def perform
      from_datetime = ::DateTime.current
      to_datetime = from_datetime - 1.minute
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
