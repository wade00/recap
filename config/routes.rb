Rails.application.routes.draw do
  resources :memories

  resources :events

  devise_for :users
  root to: "users#index"
end
