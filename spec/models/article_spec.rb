describe Article do
  it { is_expected.to have_many(:articles_followees).dependent(:destroy) }
  it { is_expected.to have_many(:followees).through(:articles_followees) }
end
