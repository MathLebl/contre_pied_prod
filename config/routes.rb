Rails.application.routes.draw do
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
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  get 'about', to: 'pages#about'
  get 'legals', to: 'pages#legals'
  get 'contacts', to: 'pages#contacts'
  root to: 'pages#home'

  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
