class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.datetime :created_at
      t.string :text
      t.integer :retweet_count
      t.boolean :favorited
      t.boolean :retweeted
      t.integer :source_id
    end
  end
end
