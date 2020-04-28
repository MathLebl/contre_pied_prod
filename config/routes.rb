Rails.application.routes.draw do
  resources :artists, only: [:index, :show ] do
    collection do
      get :concert
      get :theatre
      get :jeune_publique
    end
    member do
      get :show_jp
    end
  end
  resources :events, only: [:index, :show] do
  end

  get 'about', to: 'pages#about'
  get 'legals', to: 'pages#legals'
  root to: 'pages#home'

  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
