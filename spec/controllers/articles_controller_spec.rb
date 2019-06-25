describe ArticlesController, type: :controller do
  let(:user) { users(:basic) }

  before { login_user(user) }

  describe 'GET #index' do
    before { get :index }

    it "assigns the current user's followee" do
      expect(assigns(:followee)).to be_present
      expect(assigns(:followee)).to eq user.followee
    end

    it 'assigns the articles associated with the followee' do
      expect(assigns(:articles)).to include(*articles(:one, :two))
      expect(assigns(:articles)).to_not include(articles(:three))
    end

    it 'orders the articles by published_at' do
      expect(assigns(:articles).first.published_at).to be > assigns(:articles).second.published_at
    end
  end

  describe 'GET #show' do
    let(:article) { articles(:one) }

    before { get :show, params: { id: article.id } }

    it 'assigns the article' do
      expect(assigns(:article)).to eq article
    end
  end
end
