class ArticlesFollowee < ApplicationRecord
  belongs_to :article
  belongs_to :followee
end
