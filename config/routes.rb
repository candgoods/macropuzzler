Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'foods#index'
  resources :foods
  get 'about', to: 'foods#about'
  resources :users
end
