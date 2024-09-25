class MessagesController < ApplicationController
  def index
      @messages = @chat_room.messages
      render json: @messages
  end

  def create
    @message = @chat_room.messages.new(message_params)
    @message.user = current_user
    if @message.save
      render json: @message, status: :created
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
