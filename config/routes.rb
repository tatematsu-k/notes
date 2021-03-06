Rails.application.routes.draw do
  namespace :api, format: 'json' do
    get 'tag/search'
  end

  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'notes#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
