Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/help", to: "static_pages#help"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users do
      member do
        get :following, to: "followings#index"
        get :followers, to: "followers#index"
      end
    end
    resources :account_activations, only: :edit
    resources :password_resets, except: %i(index destroy show)
    get "password_resets/new"
    get "password_resets/edit"
    resources :microposts, only: %i(create destroy)
    resources :relationships, only: %i(create destroy)
  end
end
