class Job < ApplicationRecord
  validates :title, :content, :location, :summary, :salary, presence: true
  belongs_to :user
  has_many :job_responses, dependent: :destroy
  has_many :job_tags, dependent: :destroy
  has_many :tags, through: :job_tags
  validates :title, :content, :location, presence: true
  has_one_attached :image

  include PgSearch::Model
  pg_search_scope :search_by_title_content_location,
    against: [:title, :content, :location],
    associated_against: {
      tags: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
