# Login determination controller
class LoginController < ApplicationController
  def login
    p 'call login'
    user = User.new(user_params)
    user = User.authenticate(user.login_id, user.password)
    if user
      session[:login_user] = user.id
      redirect_to notes_path
    else
      flash[:error_message] = 'ユーザーIDまたはパスワードが間違っています。'
      flash[:login_id] = user_params[:login_id]
      redirect_to login_path
    end
  end

  def logout
    session.delete(:login_user)
    redirect_to login_path
  end

  private def user_params
    params.require(:user).permit(:name, :password, :login_id)
  end

  # check login status
  def login_check_enable?
    false
  end
end
