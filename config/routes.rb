Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  # resources :rooms do
  #   resources :messages
  # end
  resources :rooms
  resources :messages
  resources :users, :only => [:index]
end
