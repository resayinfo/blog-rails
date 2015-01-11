class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :superadmin or current_user.has_role? :god
      @articles = Article.all.order(:title)
      @superadmins = User.with_role(:superadmin).order('users.last_name, users.first_name')
      @admins = User.with_role(:admin).order('users.last_name, users.first_name')
      @users = User.order(:last_name)
    end
  end

end
