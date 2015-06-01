Rails.application.routes.draw do
  root to: "events#new"

  devise_for :users

  resources :events do
    resources :memories, only: [:index, :new, :create]
    resources :invites, only: [:new, :create, :destroy]
    resources :participants, only: [:new, :create, :destroy]
  end
end
