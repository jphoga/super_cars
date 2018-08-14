class CarPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.user == user ? true : false
  end

  def show?
    true
  end

  def create?
    true
  end
end
