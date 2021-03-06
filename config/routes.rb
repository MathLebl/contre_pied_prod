Rails.application.routes.draw do
  # get 'users/full_name'
  resources :artists, only: [:index, :show ] do
    collection do
      get :concert
      get :spectacle
      get :jeune_public
    end
    member do
      get :show_jp
    end
  end
  resources :events, only: [:index, :show] do
  end
  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      get :remove_from_cart
      get :change_from_cart
    end
    collection do
      get :show_cart
    end
  end
  resources :orders, only: [:show, :new, :create, :update] do
    resources :payments, only: :new
  end

  resources :users, only: [:edit, :update] do
    collection do
      get :full_name
      get :me
    end
  end

  get 'about', to: 'pages#about'
  get 'legals', to: 'pages#legals'
  get 'contacts', to: 'pages#contacts'
  get 'boutique', to: 'pages#boutique'
  get 'retraite', to: 'pages#retraite'
  # get 'users/me', to: 'users#me'
  post 'webhook', to: 'pages#webhook'

  root to: 'pages#home'

  ActiveAdmin.routes(self)
  devise_for :users, controllers: { confirmations: 'confirmations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
