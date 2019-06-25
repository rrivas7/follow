class CreateFollowees < ActiveRecord::Migration[6.0]
  def change
    create_table :followees do |t|
      t.string :name
      t.string :article_query

      t.timestamps
    end
  end
end
