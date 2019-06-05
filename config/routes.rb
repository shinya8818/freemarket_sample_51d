Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'buy/items/:id' => 'items#buy'

  resources :items, only: [:new, :show, :create, :index] do
    resources :images, only: [:create]
    resources :categories, only: [:create]
    resources :comments, only: [:create]
  end
  resources :users, only: [:index, :new, :show]
  resource :user_info_keep, to: "sessions#user_info_keep", only: :create
  resource :phone_entrypage, to: "sessions#phone_entrypage", only: :new
  resource :phone_info_keep, to: "sessions#phone_info_keep", only: :create
  resource :address_entrypage, to: "sessions#address_entrypage", only: :new
  resource :address_info_keep, to: "sessions#address_info_keep", only: :create
  resource :credit_entrypage, to: "sessions#credit_entrypage", only: :new
  resource :register, to: "sessions#register", only: :create
  resource :register_done, to: "sessions#register_done", only: :new
  resource :login, to:"users#login",only: :create
  resource :logout, to:"users#logout"

end
