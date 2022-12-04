Rails.application.routes.draw do
  root to: "homes#top"
  get 'home/about' => "homes#about", as: "about"
  devise_for :users
  
  resources :books, only: [:index, :show, :edit, :update, :new, :create, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :new,]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
