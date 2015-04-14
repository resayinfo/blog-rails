class WelcomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.has_role? :superadmin or current_user.has_role? :god
      @articles = Article.order(:title).paginate(:page => params[:page], :per_page => 10)
      @superadmins = User.with_role(:superadmin).order('users.last_name, users.first_name').paginate(:page => params[:page], :per_page => 10)
      @admins = User.with_role(:admin).order('users.last_name, users.first_name').paginate(:page => params[:page], :per_page => 10)
      @users = User.order(:last_name).paginate(:page => params[:page], :per_page => 30)
    end
  end

end
