class CreatePrivateChatrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :private_chatrooms do |t|
      t.references :user_sender, foreign_key: { to_table: :users }
      t.references :user_reciever, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
