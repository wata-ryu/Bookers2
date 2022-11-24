Rails.application.routes.draw do
  root to: "homes#top"
  get 'homes/about',as: 'about'
  devise_for :users
  
  resources :books, only: [:new, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
