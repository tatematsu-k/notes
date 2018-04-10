# create tag table
class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :user, foreign_key: true, index: true, null: true
      t.string :name, null: true, index: true

      t.timestamps
    end
  end
end
