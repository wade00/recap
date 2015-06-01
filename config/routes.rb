Rails.application.routes.draw do
  root to: "events#index"

  get "twilio/text" => "twilio#text"

  devise_for :users

  resources :events do
    resources :memories, :invites
  end

  resources :participants
end
