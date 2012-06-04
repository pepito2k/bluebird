class AddAttributesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :active, :boolean
    end
  end
end
