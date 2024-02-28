Rails.application.routes.draw do
  default_url_options host: 'localhost'
  get 'messages/index'
  get 'messages/new'
  get 'messages/create'
  get 'messages/update'
  root 'pages#home'
  devise_for :users
  resources :rooms do
    collection do
      get 'all_users'
    end
    resources :messages, only: :create
  end
  resources :users, :only => [:index, :show]
end
