Rails.application.routes.draw do
  devise_for :users
  root to: 'restaurants#index'
  resources :restaurants, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :chef_name
    end
    collection do
      get :top
    end
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
