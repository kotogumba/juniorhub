class JobPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
    # TODO delete line above and uncomment line below
    # user.admin?
  end

  def update?
    true
    # TODO delete line above and uncomment line below
    # record.user == user
    # record: the restaurant passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def new?
    true
    # only for test purpose for now.
    # need to create new job to see if I can update
  end

  def toggle_favorite?
    true
  end

  def destroy?
    record.user == user
  end
end
