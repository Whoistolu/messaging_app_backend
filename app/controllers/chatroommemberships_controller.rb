class ChatRoomMembershipsController < ApplicationController

  def create
    @chat_room_membership = ChatRoomMembership.new(membership_params)
    if @chat_room_membership.save
      render json: @chat_room_membership, status: :created
    else
      render json: @chat_room_membership.errors, status: :unprocessable_entity
    end
  end

  private

  def membership_params
    params.require(:chat_room_membership).permit(:user_id, :chat_room_id)
  end
end