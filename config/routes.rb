Rails.application.routes.draw do
  devise_for :admins
  root 'homes#index'
  devise_for :users

  resources :doctors, only: [:index]
end
