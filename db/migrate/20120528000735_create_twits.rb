class CreateTwits < ActiveRecord::Migration
  def change
    create_table :twits do |t|
      t.datetime :created_at
      t.integer :twit_id
      t.string :text
      t.integer :retweet_count
      t.boolean :favorited
      t.boolean :retweeted
      t.integer :source_id
      t.boolean :processed, default: false
    end
    add_index(:twits, :twit_id, {unique: true})
  end
end