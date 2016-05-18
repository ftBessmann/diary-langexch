class CreateProfiles < ActiveRecord::Migration
  def change
  	create_table :profiles do |t|
  		t.string :name, null: false
  		t.date :birthday
  		t.string :gender, null: false
  		t.integer :country_id, null: false
  		t.string :avatar_url
  		t.string :description
  		t.belongs_to :user, index: true

  		t.datetime :last_login
  		t.timestamps null: false
  	end
  end
end
