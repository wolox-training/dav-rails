Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books, only: [:index, :show]
  resources :openlibrary, only: :show, param: :isbn
  # get 'books/search/:isbn', to: 'openlibrary#show'
  resources :book_suggestions, only: :create 

  root to: 'application#index'
end
