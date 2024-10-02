Rails.application.routes.draw do
  devise_for :users
  resources :notes, only: [:new, :create, :index]
  root 'notes#index'
end
