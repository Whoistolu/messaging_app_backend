class ChatRoomMembershipsController < ApplicationController

  def create
    @chat_room_membership = ChatRoomMembership.new(membership_params)
    if @chat_room_membership.save
      render json: @chat_room_membership, status: :created
    else
      render json: @chat_room_membership.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chat_room_membership = ChatRoomMembership.find_by(user_id: params[:user_id], chat_room_id: params[:chat_room_id])
    if @chat_room_membership
      @chat_room_membership.destroy
      head :no_content
    else
      render json: { error: 'Membership not found' }, status: :not_found
    end
  end

  private

  def membership_params
    params.require(:chat_room_membership).permit(:user_id, :chat_room_id)
  end
end