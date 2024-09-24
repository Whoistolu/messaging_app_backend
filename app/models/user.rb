class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chat_room_memberships, dependent: :destroy
  has_many :chat_rooms, through: :chat_room_memberships
  has_many :messages
end
