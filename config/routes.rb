Rails.application.routes.draw do
  root to: "events#new"

  devise_for :users

  resources :events do
    resources :memories, only: [:index, :new, :create]
    resources :participants, only: [:index, :new, :create, :destroy]
  end
end
