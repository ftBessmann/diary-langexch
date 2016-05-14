class CreateDiaries < ActiveRecord::Migration
  def change
  	create_table :diaries do |t|
  		t.belongs_to :owner, index: true

  		t.timestamps null: false
  	end
  end
end
