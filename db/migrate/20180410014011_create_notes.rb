# create notes table
class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :title, index: true, null: true
      t.text :content
      t.references :user, foreign_key: true, index: true, null: true

      t.timestamps
    end
  end
end
