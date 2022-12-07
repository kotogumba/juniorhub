class JobTag < ApplicationRecord
  belongs_to :job
  belongs_to :tag
  #validates_uniqueness_of :job, scope[:tag]
end
