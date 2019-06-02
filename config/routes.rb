Rails.application.routes.draw do
  resources :matches
  devise_for :users
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
