class CreateNativeLanguages < ActiveRecord::Migration
  def change
    create_table :native_languages do |t|
      t.belongs_to :profile, index: true
      t.belongs_to :language, index: true
  end
end
