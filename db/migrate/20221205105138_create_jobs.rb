class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :content
      t.string :location
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
