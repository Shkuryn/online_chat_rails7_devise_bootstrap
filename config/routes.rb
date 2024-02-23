Rails.application.routes.draw do
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  get 'messages/update'
  root 'pages#home'
  devise_for :users
  resources :rooms do
    resources :messages, only: :create
  end
  resources :users, :only => [:index, :show]
end
