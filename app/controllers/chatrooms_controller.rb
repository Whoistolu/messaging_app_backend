class ChatRoomsController < ApplicationController
   before_action :set_chat_room

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

   def show
      @messages = @chat_room.messages
      render json: { chat_room: @chat_room, messages: @messages }
   end

   def destroy
      @chat_room.destroy
      head :no_content
   end

   private

   def set_chat_room
     @chat_room = ChatRoom.find(params[:id])
   end
 
   def chat_room_params
     params.require(:chat_room).permit(:name, :is_private)
   end
end