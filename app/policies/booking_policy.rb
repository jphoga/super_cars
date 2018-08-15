class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope == Booking
      scope.where(user: user)
      # Booking.all
      # Booking.where(user: user)
      # scope == Booking
    end
  end

  def destroy?
    record.user == user
  end

  def show?
    record.user == user

  end

  def create?
    user
  end
end
