Rails.application.routes.draw do
  devise_for :users

  resources :chat_rooms, only: [:index, :show, :create, :destroy] do
    
  end
end
