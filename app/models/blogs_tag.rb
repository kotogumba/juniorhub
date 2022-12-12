class BlogsTag < ApplicationRecord
  belongs_to :blog
  belongs_to :tag
end
