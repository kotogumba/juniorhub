class CreateBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :content
      t.references :blog, foreign_key: true

      t.timestamps
    end
  end
end
