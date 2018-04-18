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
      if tag.blank?
        tag = Tag.new
        tag.user = user
        tag.name = tag_name
        tag.save
      end
      tag
    end
  end
end
