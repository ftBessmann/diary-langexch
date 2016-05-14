class CreateCorrections < ActiveRecord::Migration
  def change
    create_table :corrections do |t|
      t.string :content
      t.belongs_to :profile, index: true
      t.belongs_to :diary_entry, index: true

      t.timestamps null: false
  end
end
