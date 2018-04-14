Rails.application.routes.draw do
  post '/login', to: 'login#login'
  get '/logout', to: 'login#logout'

  root to: 'users#index'
  get '/login', to: 'users#index'
  resources :notes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
