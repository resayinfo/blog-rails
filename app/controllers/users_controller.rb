class UsersController < ApplicationController
  before_action :authenticate_user!

  helper_method :sort_column, :sort_direction

  def index
    @users = User.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if params[:user][:password].empty?
      logger.debug 'should delete password here'
      params[:user].delete :password
    end

    logger.debug "params = #{params}"

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to user_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully deleted.' }
    end
  end

  # GET /users/search?q=
  def search
    @query = params[:q]
    @users = []
    if @query.present?
      @users =  User.where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{@query.downcase}%", "%#{@query.downcase}%").paginate(:page => params[:page], :per_page => 30)
    else
      @users = User.order('users.last_name, users.first_name').paginate(:page => params[:page], :per_page => 30)
    end
  end

  private

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "last_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :biography, :avatar, :avatar_cache, :remove_avatar)
  end

end
