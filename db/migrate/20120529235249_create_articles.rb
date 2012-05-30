class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :body
      t.text :body_html
      t.string :url
      t.text :description
      t.datetime :date_published
      t.integer :source_id
      t.integer :twitter_shares
      t.integer :facebook_shares
      t.integer :google_plus_shares
      t.boolean :active

      t.timestamps
    end
  end
end
