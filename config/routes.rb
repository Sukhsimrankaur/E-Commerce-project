Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  namespace :admin do
  resources :products
  resources :categories
  get '/', to: 'dashboard#index', as: 'dashboard'
end

  get 'up' => 'rails/health#show', as: :rails_health_check

  root "home#index"
end
