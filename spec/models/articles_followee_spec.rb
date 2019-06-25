describe ArticlesFollowee do
  it { is_expected.to belong_to(:article) }
  it { is_expected.to belong_to(:followee) }
end
