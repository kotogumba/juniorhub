class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, foreign_key: true
      t.references :blog_post, foreign_key: true
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
