class ChatRoomMembershipsController < ApplicationController
  private

  def membership_params
    params.require(:chat_room_membership).permit(:user_id, :chat_room_id)
  end
end