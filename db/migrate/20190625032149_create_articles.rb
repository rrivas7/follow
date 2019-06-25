class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :author
      t.string :source
      t.string :title
      t.text :description
      t.text :content
      t.string :url
      t.string :image_url
      t.datetime :published_at

      t.timestamps
    end
  end
end
