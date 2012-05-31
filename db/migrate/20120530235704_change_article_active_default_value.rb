class ChangeArticleActiveDefaultValue < ActiveRecord::Migration
  def up
    change_column :articles, :active, :boolean, :default => true
  end

  def down
    change_column :articles, :active, :boolean, :default => false
  end
end
