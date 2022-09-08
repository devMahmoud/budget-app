Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "home#index"
  resources :home, only: [:index]
  resources :groups, only: [:index, :show, :new, :create] do
    resources :operations, only: [:index, :new, :create]
  end
end
