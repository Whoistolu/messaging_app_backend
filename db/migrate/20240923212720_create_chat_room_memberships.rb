class CreateChatRoomMemberships < ActiveRecord::Migration[7.0]
  def change
    create_table :chat_room_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chat_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
