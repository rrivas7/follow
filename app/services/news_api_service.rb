class NewsApiService
  GET_EVERYTHING_ENDPOINT = 'https://newsapi.org/v2/everything'.freeze

  def get_everything(params: {})
    query = params.merge(apiKey: Follow::Application.credentials.NEWS_API_KEY)
    ::HTTParty.get(GET_EVERYTHING_ENDPOINT, query: query)
  end
end
