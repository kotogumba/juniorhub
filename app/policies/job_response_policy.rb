class JobResponsePolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end
end
