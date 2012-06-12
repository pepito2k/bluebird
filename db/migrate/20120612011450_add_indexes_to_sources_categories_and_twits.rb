class AddIndexesToSourcesCategoriesAndTwits < ActiveRecord::Migration
  def change
    add_index :articles, :source_id
    add_index :sources, :category_id
    add_index :twits, :source_id
  end
end
