class SpaceshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    return create?
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
