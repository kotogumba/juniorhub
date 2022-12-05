class JobsController < ApplicationController
  validates :title, :description, :location, presence: true
  
end
