describe Followee do
  it { is_expected.to have_many(:articles_followees).dependent(:destroy) }
  it { is_expected.to have_many(:articles).through(:articles_followees) }
end
