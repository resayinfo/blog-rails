class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new # guest user (not logged in)
    if user.has_role? :god
      can :manage, :all

    elsif user.has_role? :superadmin
      can :manage, :all
      # .. Cannot manage other superadmins because of "if current_user.has_role? :god" in 'superadmins/new.html.erb'

    elsif user.has_role? :admin
      can :read, Article
      can :search, Article
      can :manage, Comment
      can :manage, User, id: user.id

    else
      can :read, Article
      can :search, Article
      can :read, Comment
      can :manage, User, id: user.id
    end

  end
end
