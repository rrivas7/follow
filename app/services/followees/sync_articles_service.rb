module Followees
  class SyncArticlesService
    def initialize(followee:)
      @followee = followee
    end

    def sync_articles(from_datetime: nil, to_datetime: nil)
      response_articles = collect_news_api_articles(from_datetime: from_datetime, to_datetime: to_datetime)
      response_articles.each do |response_article|
        article = find_or_create_article(deserialize_article(response_article))
        find_or_create_articles_followee(article)
      end
    end

    def collect_news_api_articles(from_datetime: nil, to_datetime: nil)
      params = {
        from_datetime: from_datetime,
        to_datetime: to_datetime,
        language: :en,
        q: @followee.article_query
      }.compact
      ::NewsApiService.new().get_everything(params: params).parsed_response['articles']
    end

    protected
      def find_or_create_article(article_attributes)
        ::Article.find_or_create_by(article_attributes)
      end

      def find_or_create_articles_followee(article)
        ::ArticlesFollowee.find_or_create_by(article: article, followee: @followee)
      end

      def deserialize_article(serialized_article)
        {
          author: serialized_article['author'],
          content: serialized_article['content'],
          description: serialized_article['description'],
          image_url: serialized_article['urlToImage'],
          published_at: serialized_article['publishedAt'],
          source: serialized_article['source']['name'],
          title: serialized_article['title'],
          url: serialized_article['url']
        }
      end
  end
end
