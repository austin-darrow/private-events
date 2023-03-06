Rails.application.routes.draw do
  root 'events#index'
  resources :events
  resources :attendances, only: [:create, :destroy]
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
end
