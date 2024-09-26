Rails.application.routes.draw do
  devise_for :users

  resources :chat_rooms, only: [:index, :show, :create, :destroy] do
    resources :messages, only: [:index, :create]
    resources :chat_room_memberships, only: [:create, :destroy]
  end
end
