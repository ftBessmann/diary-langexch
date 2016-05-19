class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true, index: true
      t.belongs_to :profile, index: true

      t.timestamps null: false
    end
  end
end
