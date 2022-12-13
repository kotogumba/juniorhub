class AddSelfToComment < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :self, foreign_key: { to_table: :comments }
  end
end
