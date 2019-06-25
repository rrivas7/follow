class Article < ApplicationRecord
  has_many :articles_followees, dependent: :destroy
  has_many :followees, through: :articles_followees
end
