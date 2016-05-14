class CreateProfiles < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.string :name
  		t.date :birthday
  		t.string :gender
  		t.integer :country_id
  		t.string :avatar_url
  		t.string :description
  		t.belongs_to :user, index: true

  		t.timestamps null: false
  	end
  end
end
