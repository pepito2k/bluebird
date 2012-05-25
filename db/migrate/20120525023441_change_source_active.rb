class ChangeSourceActive < ActiveRecord::Migration
  def up
    change_column :sources, :active, :boolean, :default => true
  end

  def down
    change_column :sources, :active, :boolean
  end
end
