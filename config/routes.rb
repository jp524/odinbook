Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'
  resources :users, only: %i[index show]
  resources :posts, only: %i[index new create]
  resources :profiles, only: %i[edit update]
end
