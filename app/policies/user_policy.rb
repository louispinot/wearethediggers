class UserPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end


  def index?
    admin_right?
  end

  def show?
    admin_right?
  end

  def new?
    create?
  end
  def create?
    admin_right?
  end


  def edit?
    update?
  end
  def update?
    admin_right?
  end

  def destroy?
    admin_right?
  end

  private

  def admin_right?
    if user.admin?
      true
    else
      false
    end
  end

end

