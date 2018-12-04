class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def index?
      return true
    end

    def create?
      user.admin?
    end

    def update?
      user.admin?
    end

    def edit?
      user.admin?
    end

    def new?
      user.admin?
    end

  end
end
