Rails.application.routes.draw do
  get "cart/show", to: "cart#show", as: :cart

  post "cart/add_item/:product_id", to: "cart#add_to_cart", as: :add_to_cart
  delete "cart/remove_item/:product_id", to: "cart#remove_from_cart", as: :remove_from_cart
  patch "cart/update_item/:product_id", to: "cart#update_item", as: :update_cart_item

  get "home/index"
  devise_for :users

  resources :products, only: [:index, :show] do
    collection do
      get 'search'
    end
  end

  namespace :admin do
    resources :products
    resources :categories
    get '/', to: 'dashboard#index', as: 'dashboard'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check

  root "products#index"
end
