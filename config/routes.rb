Rails.application.routes.draw do
  get 'books/new'
  get 'books/creat'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  devise_for :books
  devise_for :users
  root to: "homes#top"
  get "homes/about" =>"homes#about",as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
