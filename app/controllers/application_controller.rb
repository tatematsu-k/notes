class ApplicationController < ActionController::Base
  before_action :login_check, if: :login_check_enable?

  protect_from_forgery with: :exception

  def login_check
    p 'call login check'
    if (user = session[:login_user])
      @login_user = User.find(user)
      unless @login_user
        puts "access user is not exist in DB (login_id: #{user} )"
        redirect_to login_path
      end

      init
    else
      flash[:error_message] = 'ログイン後一定時間操作が無かったため自動ログアウトしました。'
      puts 'fails access to not find login session'
      redirect_to login_path
    end
  end

  def init
    set_menu_items
  end

  def set_menu_items
    @menu_items = {
      home: {
        title: 'ホーム',
        path: notes_path,
        active: true
      },
      new_note: {
        title: '登録',
        path: new_note_path,
        active: false
      },
      logout: {
        title: 'ログアウト',
        path: logout_path,
        active: false
      }
    }
  end

  def menu_active_reset
    @menu_items.each do |_key, item|
      item[:active] = false
    end
  end

  # check login status
  def login_check_enable?
    true
  end
end
