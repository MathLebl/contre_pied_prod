Rails.application.routes.draw do
  resources :artists, only: [:index, :show] do
    collection do
      get :category
    end
  end
  resources :events, only: [:index,] do
  end

  get 'about', to: 'pages#about'
  root to: 'pages#home'

  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
