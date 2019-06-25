describe 'Articles' do
  let(:user) { users(:basic) }

  before { login_as(user) }

  describe 'home page' do
    it 'lands on the articles index' do
      visit root_path

      expect(page).to have_selector('.page-header', text: "News Feed for #{user.followee.name}")
    end
  end

  describe 'articles index' do
    before { visit articles_path }

    it 'lists the articles associated with the followee' do
      expect(user.followee.articles).to_not be_empty
      user.followee.articles.each do |article|
        expect(page).to have_selector("#article-#{article.id}")
      end
    end

    it 'orders the articles by published at' do
      article_elements = all('.card')
      expect(article_elements[0]['id']).to eq "article-#{articles(:two).id}"
      expect(article_elements[1]['id']).to eq "article-#{articles(:one).id}"
    end

    it 'can view a specific article' do
      find("[href='#{article_path(articles(:one))}']").click
      expect(page).to have_selector('.page-header', text: articles(:one).title)
      expect(current_path).to eq(article_path(articles(:one)))
    end
  end

  describe 'articles show' do
    let(:article) { articles(:one) }

    before { visit article_path(article) }

    it 'lists the details of the article' do
      %i[title content author source].each do |attribute|
        expect(page).to have_content(article.send(attribute))
      end
    end
  end
end
