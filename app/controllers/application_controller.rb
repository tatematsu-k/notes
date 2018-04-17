class ApplicationController < ActionController::Base
  before_action :init, :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def init
    set_menu_items
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
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
        path: destroy_user_session_path,
        method: 'delete',
        active: false
      }
    }
  end

  def menu_active_reset
    @menu_items.each do |_key, item|
      item[:active] = false
    end
  end
end
