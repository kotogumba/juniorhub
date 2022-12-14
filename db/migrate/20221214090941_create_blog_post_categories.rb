class CreateBlogPostCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_post_categories do |t|
      t.references :blog_post, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
