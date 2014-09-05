Rails.application.routes.draw do

  resources :users
  resources :links do
    resources :comments
  end
end
