if @comment.persisted?
  json.form render(partial: "comments/form", formats: :html, locals: {blog: @blog, blog_post: @blog_post, comment: Comment.new})
  json.inserted_item render(partial: "comments/comment", formats: :html, locals: {comment: @comment})
else
  json.form render(partial: "comments/form", formats: :html, locals: {blog: @blog, blog_post: @blog_post, comment: @comment})
end
