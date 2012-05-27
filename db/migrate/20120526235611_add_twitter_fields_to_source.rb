class AddTwitterFieldsToSource < ActiveRecord::Migration
  def change
    change_table :sources do |t|
      t.rename :name, :screen_name

      t.column :twitter_id, :integer
      t.column :name, :string
      t.column :location, :string
      t.column :description, :string
      t.column :url, :string
      t.column :date_registration, :datetime
      t.column :lang, :string
      t.column :profile_image_url, :string
    end
  end
end
