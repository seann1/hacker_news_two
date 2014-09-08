Rails.application.routes.draw do

get 'signup', to: 'users#new', as: 'signup'
get 'login', to: 'sessions#new', as: 'login'
get 'logout', to: 'sessions#destroy', as: 'logout'

resources :users
resources :sessions

  get 'sessions/new'

  resources :users
  resources :links do
    resources :votes
    resources :comments
  end

  root :to => 'links#index'
end
