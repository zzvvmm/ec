Rails.application.routes.draw do
  get 'carts/index'
  get 'products/show'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/home", to: "static_pages#home"

    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :products, only: [:show]
    
    namespace :admin do
      root "static_pages#index"
      resources :orders, only: [:index, :edit, :update]
      resources :products, only: [:index]
    end

    resources :carts, only: [:index] do
      collection do
        get "/add_to_cart/:id", to: "carts#add_to_cart", as: "add_to"
      end
    end
  end
end
