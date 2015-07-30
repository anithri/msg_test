class HeroPolicy < ApplicationPolicy

  def create?
    user == 'Alfred'
  end

  def update?
    create?
  end

  def destroy?
    create?
  end

  ###################
  # SCOPE FOR INDEX #
  ###################
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
