class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  def name
    "#{first_name} #{last_name}"
  end
end
