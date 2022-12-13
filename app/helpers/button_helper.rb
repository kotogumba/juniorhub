module ButtonHelper
  def voted(blog, blog_post)
    vote = Vote.find_by(user: current_user, blog_post: blog_post)
    if vote
      button_to blog_blog_post_vote_path(blog, blog_post, blog_post.votes.where(user: current_user).first, value: 1), method: :patch, class: "like" do
        '<i class="fa-solid fa-heart"></i>'.html_safe
      end

      button_to blog_blog_post_vote_path(blog, blog_post, blog_post.votes.where(user: current_user).first, value: -1), method: :patch, class: "dislike" do
        '<i class="fa-solid fa-heart-crack"></i>'.html_safe
      end
    else
      button_to blog_blog_post_vote_path(blog, blog_post, value: 1), method: :post, class: "like" do
        '<i class="fa-solid fa-heart"></i>'.html_safe
      end
      button_to blog_blog_post_vote_path(blog, blog_post, value: -1), method: :post, class: "dislike" do
        '<i class="fa-solid fa-heart-crack"></i>'.html_safe
      end
    end
  end
end
