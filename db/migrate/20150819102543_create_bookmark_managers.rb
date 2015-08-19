class CreateBookmarkManagers < ActiveRecord::Migration
  def change
    create_table :bookmark_managers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
