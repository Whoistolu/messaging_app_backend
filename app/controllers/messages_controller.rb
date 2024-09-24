class MessagesController < ApplicationController
  def index
      @messages = @chat_room.messages
      render json: @messages
  end
end