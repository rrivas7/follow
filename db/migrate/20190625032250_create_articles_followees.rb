class CreateArticlesFollowees < ActiveRecord::Migration[6.0]
  def change
    create_table :articles_followees do |t|
      t.references :article, foreign_key: true
      t.references :followee, foreign_key: true
    end
  end
end
