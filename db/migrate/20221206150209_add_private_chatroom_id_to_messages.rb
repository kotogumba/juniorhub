class AddPrivateChatroomIdToMessages < ActiveRecord::Migration[7.0]
  def change
    # reference to the private chatroom
    add_reference :messages, :private_chatroom, foreign_key: true
  end
end
