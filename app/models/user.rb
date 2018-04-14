# user account model
class User < ApplicationRecord
  class << self
    def authenticate(login_id, pass)
      User.find_by(login_id: login_id, password: pass)
    end

    def exist_user(login_id)
      User.find_by(login_id: login_id)
    end
  end
end
