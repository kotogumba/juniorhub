class Comment < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :blog_post
  has_many :comments, foreign_key: :parent_id
  belongs_to :parent, class_name: 'Comment', optional: true
end
