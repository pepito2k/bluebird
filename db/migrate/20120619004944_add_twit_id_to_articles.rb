class AddTwitIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :twit_id, :integer
    add_index :articles, :twit_id
  end
end
