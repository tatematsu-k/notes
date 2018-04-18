class TagMemo < ApplicationRecord
  has_many :notes
  has_many :tags
end
