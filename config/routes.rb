Rails.application.routes.draw do
  get "home/index"
  devise_for :users

  namespace :admin do
    get '/', to: 'dashboard#index', as: 'dashboard'
    get 'dashboard/index'  # Optional if you want this route too
  end

  # Health check endpoint
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Root route
  root 'home#index'

  # Other routes you may uncomment or add here...
  # get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest
  # get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
end
