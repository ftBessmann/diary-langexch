class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.belongs_to :profile, index: true
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
  end
end
