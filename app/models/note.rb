class Note < ApplicationRecord
  belongs_to :user

  has_many :tag_memos
  has_many :tags, through: :tag_memos
end
