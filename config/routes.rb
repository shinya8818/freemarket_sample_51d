Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations",omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'purchase/index'
  get 'purchase/done'
  get 'card/new'
  get 'card/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  # get 'buy/items/:id' => 'items#buy'

  resources :card, only: [:new, :show] do
    collection do
      post 'pay', to: 'card#pay'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index/items/:id', to: 'purchase#index'
      post 'pay/items/:id', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  resources :items, only: [:new, :create, :edit, :update, :destroy, :show, :index] do
    resources :images, only: [:create]
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, only: [:create, :index, :new] do
    collection do
      get 'ancestors'
      get 'children'
      get 'siblings'
    end
  end
  resources :users, only: [:index, :new, :show, :create]
  
  devise_scope :user do
    resource :user_info_keep, to: "sessions#user_info_keep", only: :create
    resource :phone_entrypage, to: "sessions#phone_entrypage", only: :new
    resource :phone_info_keep, to: "sessions#phone_info_keep", only: :create
    resource :address_entrypage, to: "sessions#address_entrypage", only: :new
    resource :address_info_keep, to: "sessions#address_info_keep", only: :create
    resource :credit_entrypage, to: "sessions#credit_entrypage", only: :new
    resource :register, to: "sessions#register", only: :create
    resource :register_done, to: "sessions#register_done", only: :new
  end
  resource :login, to:"users#login",only: :create
  resource :logout, to:"users#logout"
  resource :credit, to:"users#card"
  resource :cardadd, to:"users#cardadd"
  resource :exhibition, to:"users#exhibition"
  resource :identity, to:"users#identity"
  resource :profile, to:"users#profile"
  resource :complete, to:"users#complete"
end
