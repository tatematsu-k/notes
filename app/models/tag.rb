class Tag < ApplicationRecord
  has_many :tag_memos
  has_many :notes, through: :tag_memos
end
