class JobResponsePolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
