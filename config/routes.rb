Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :users, only: [:index, :new]
  get 'users/logout' => 'users#logout'
  get 'users/new' => 'users#new'
  get 'users/show' => 'users#address'
end
