Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :books do
    collection do
      get :book_information
    end
  end

  root to: 'application#index'
end
