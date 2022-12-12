class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post
  validates :user_id, uniqueness: { scope: :blog_post_id }
end
