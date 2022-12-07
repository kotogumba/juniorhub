class AddNewStatusToPrivateMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :private_messages, :new, :boolean, default: true
  end
end
