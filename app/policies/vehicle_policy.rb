class VehiclePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  # def new? is inherited from ApplicationPolicy, so no need to defeine here

  def create?
    user
  end

  def show?
    true
  end
end
