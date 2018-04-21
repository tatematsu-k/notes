class Tag < ApplicationRecord
  belongs_to :user
  has_many :tag_memos
  has_many :notes, through: :tag_memos

  class << self
    def search_candidate(user, tag_name)
      Tag.select('id', 'name')
          .where(['user_id = ?', user.id])
          .where(['name like ?', "#{tag_name}%"])
          .order('created_at')
    end

    def search_or_insert(user, tag_name)
      tag = Tag.select('id', 'name')
          .where(['user_id = ?', user.id])
          .where(['name = ?', tag_name])
          .first
      if tag.blank?
        tag = Tag.new
        tag.user = user
        tag.name = tag_name
        tag.save
      end
      tag
    end

    def update_note_tags(user, note_id, tags)
      TagMemo.delete_by_note_id(note_id)
      tag_list = [] if tags.present?
      tags.each do |tag|
        tag = Tag.search_or_insert(user, tag.name)
        tag_memo = TagMemo.new
        tag_memo.note_id = note_id
        tag_memo.tag_id = tag.id
        tag_memo.save
        tag_list << tag
      end
      tag_list
    end
  end
end
