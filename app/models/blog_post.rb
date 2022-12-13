class BlogPost < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :blog
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
end
