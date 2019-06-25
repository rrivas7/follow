class Followee < ApplicationRecord
  has_many :articles_followees, dependent: :destroy
  has_many :articles, through: :articles_followees
end
