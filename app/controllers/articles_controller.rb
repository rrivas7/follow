class ArticlesController < ApplicationController
  before_action :find_followee, only: :index
  before_action :find_article, only: :show

  def index
    @articles = @followee.articles.order(published_at: :desc)
  end

  def show
  end

  protected
    def find_article
      @article = Article.find(params[:id])
    end

    def find_followee
      @followee = current_user.followee
    end
end
