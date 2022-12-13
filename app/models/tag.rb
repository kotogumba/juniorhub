class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :job_tags, dependent: :destroy
  has_many :jobs, through: :job_tags
  has_many :blogs, through: :blog_posts
end
