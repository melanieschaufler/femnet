class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user) if user
    end
  end

  def index?
    return true
  end

  # def my_requests?
  #   return true
  # end

  # def accept?
  #   return true
  # end

  # def ignore?
  #   return true
  # end

  # def show?
  #   return true
  # end

  # def create?
  #   return true
  # end

  # def destroy?
  #   record.user == user
  # end
end
