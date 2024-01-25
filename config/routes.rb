Rails.application.routes.draw do
  root 'pages#home'
  devise_for :users
  resources :rooms
  resources :users, :only => [:index]
end
