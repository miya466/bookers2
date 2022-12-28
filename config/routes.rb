Rails.application.routes.draw do
  get 'users/index'
  get 'users' => 'users#index'
  get 'users/show'
  get 'users/edit'
  patch 'users/:id' => 'users#update', as: 'update_user'

  get 'books/index'
  get 'books' => 'books#index'
  post 'books' => 'books#create'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  patch 'books/:id' => 'books#update', as: 'update_list'
  delete 'books/:id' => 'books#destroy', as: 'destroy_list'
  get 'books/new'
  get 'books/:id' => 'books#show', as: :book
  get 'home/top'
  get 'home/about' => 'home#about', as: "about"
  devise_for :users
  root to: "home#top"

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
