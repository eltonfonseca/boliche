Rails.application.routes.draw do
  resources :matches do
    resources :home
  end
  devise_for :users
  root to: 'matches#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
