# create tag_memo table
class CreateTagMemos < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_memos do |t|
      t.references :note, foreign_key: true, index: true, null: true
      t.references :tag, foreign_key: true, index: true, null: true

      t.timestamps
    end
  end
end
