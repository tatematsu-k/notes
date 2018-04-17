# user account model
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :notes

  class << self
    def get_name(id)
      user = User.find(id)
      user.name
    end
  end
end
