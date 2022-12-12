class CreateBlogsTags < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs_tags do |t|
      t.references :blog, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
