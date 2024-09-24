class ChatRoomsController < ApplicationController
   def index
      @chat_rooms = ChatRoom.all
      render json: @chat_rooms
      end

   def create
      @chat_room = ChatRoom.new(chat_room_params)
      if @chat_room.save
         render json: @chat_room, status: :created
      else
         render json: @chat_room.errors, status: :unprocessable_entity
      end
   end
end