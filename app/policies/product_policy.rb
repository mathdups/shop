class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def create?
      record.user == admin
    end
    
  end
end

