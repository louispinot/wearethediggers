class PicturePolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
  def index?
    true
  end

  def show?
    true
  end

  def new?
    create?
  end
  def create?
    superuser_rights?
  end


  def edit?
    update?
  end
  def update?
    superuser_rights?
  end

  def destroy?
    admin_right?
  end

  private

  def admin_right??
    if user.admin?
      true
    else
      false
    end
  end

  def superuser_rights?
    if user.superuser? || user.admin?
      true
    else
      false
    end
  end

end
