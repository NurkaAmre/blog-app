class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all if user.role == 'admin'

    can :destroy, Post, author: user
    can :destroy, Comment, author: user
  end
end
