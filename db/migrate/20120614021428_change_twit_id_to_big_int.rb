class ChangeTwitIdToBigInt < ActiveRecord::Migration
  def up
  	change_column :twits, :twit_id, :integer, :limit => 8
  end

  def down
  	change_column :twits, :twit_id, :integer
  end
end
