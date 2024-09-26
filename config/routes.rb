Rails.application.routes.draw do
  devise_for :users
  
  resources :messages, only: [:index, :create]
  resources :chat_room_memberships, only: [:create, :destroy]
end
