class VehiclePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end


  end

  def create?
    # true
    # user_signed_in? does not work here...
    user
  end

  def show?
    true
  end
end
