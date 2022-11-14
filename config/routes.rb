Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    post "favorite_products", to: "favorite_products#create", defaults: { format: 'js' }, :as => 'create_favorited_product'
    delete "favorite_products/id", to: "favorite_products#destroy", defaults: { format: 'js' }, :as => 'favorited_product'

    resources :products, only: [:show]
    resources :orders, only: [:new, :create]
    
    namespace :admin do
      root "static_pages#index"
      resources :orders, only: [:index, :edit, :update]
      resources :products
      resources :xlsx
      get :order_status, to: "static_pages#order_status"
      get :order_total_money_month, to: "static_pages#order_total_money_month"
      get :order_total_money_quarter, to: "static_pages#order_total_money_quarter"
      get :order_total_money_year, to: "static_pages#order_total_money_year"
      get :order_accept_month, to: "static_pages#order_accept_month"
      get :order_accept_quarter, to: "static_pages#order_accept_quarter"
      get :order_accept_year, to: "static_pages#order_accept_year"
    end

    resources :carts, only: [:index] do
      collection do
        get "/add_to_cart/:id", to: "carts#add_to_cart", as: "add_to"
        get "remove/:id", to: "carts#remove_from_cart", as: "remove_from"
        put "update_cart/:id", to: "carts#update_cart", as: "update"
      end
    end
  end
end
