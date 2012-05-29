class AddUniqueIndexToSourceScreenName < ActiveRecord::Migration
  def change
    change_table :sources do |t|
      t.index :screen_name, unique: true
    end
  end
end
