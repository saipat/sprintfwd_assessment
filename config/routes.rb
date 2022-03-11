Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :members
  # resources :members, only: [:show, :update, :create, :destroy]

  resources :teams do
    resources :members, only: :index
  end

  resources :projects do
    resources :members, only: :index

    member do
      get 'preview'
    end
  end

end
