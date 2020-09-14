Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'

  resources :products do
    resources :purchases, only: [:index, :create]

    collection do
      get 'search'
    end
  end
end
