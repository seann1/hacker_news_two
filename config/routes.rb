Rails.application.routes.draw do

  resources :users
  resources :links do
    resources :votes
    resources :comments
  end

  root :to => 'links#index'
end
