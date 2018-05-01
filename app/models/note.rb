class Note < ApplicationRecord
  belongs_to :user

  has_many :tag_memos
  has_many :tags, through: :tag_memos

  class << self
    def all_load_by_user(login_user)
      Note.where(user: login_user).order(:updated_at).reverse_order
    end
  end
end
