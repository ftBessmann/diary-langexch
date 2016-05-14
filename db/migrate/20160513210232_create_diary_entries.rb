class CreateDiaryEntries < ActiveRecord::Migration
  def change
  	create_table :diary_entries do |t|
  		t.string :title
  		t.string :content
  		t.belongs_to :language, index: true
  		t.belongs_to :diary, index: true

  		t.timestamps null: false
  	end
  end
end
