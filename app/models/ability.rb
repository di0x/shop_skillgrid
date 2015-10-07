class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == "admin"
        can :manage, :all
    elsif user.role == "seller"
        can [:read, :create, :update, :see_pro, :destroy], :all
    elsif user.role == "user"
        can [:read, :see_pro], :all
    else
        can :read, :all
    end
  end
end
