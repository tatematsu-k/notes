class TagMemo < ApplicationRecord
  belongs_to :note
  belongs_to :tag

  class << self
    def delete_by_note_id(note_id)
      TagMemo.where('note_id = ?', note_id).destroy_all
    end
  end
end
