class SuperadminsController < ApplicationController
  # before_action :authenticate_user!
  # load_and_authorize_resource :superadmin, class: 'User'

  before_action :cancan_rails4_hack
  load_and_authorize_resource :superadmin, class: User.with_role(:superadmin)

  def cancan_rails4_hack
    @superadmin = User.new
  end

  def index
    @superadmin = User.with_role(:superadmin).order('users.last_name, users.first_name')
  end

  def show
    @superadmin = User.find(params[:id])
  end

  def new
    @superadmin = User.new
    @superadmin.add_role :superadmin
  end

  def edit
    @superadmin = User.find(params[:id])
  end

  def create
    @superadmin = User.new(superadmin_params)
    # @admin.password = Devise.friendly_token.first(8)

    respond_to do |format|
      if @superadmin.save
        @superadmin.add_role :superadmin
        format.html { redirect_to superadmin_path(@superadmin), notice: 'Super was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @superadmin = User.find(params[:id])

    if params[:user][:password].empty?
      logger.debug 'should delete password here'
      params[:user].delete :password
    end

    logger.debug "params = #{params}"

    respond_to do |format|
      if @superadmin.update_attributes(superadmin_params)
        format.html { redirect_to superadmin_path(@superadmin), notice: 'Super was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @superadmin = User.find(params[:id])
    @superadmin.destroy

    respond_to do |format|
      format.html { redirect_to superadmins_path, notice: 'Super was successfully deleted.' }
    end
  end

  # GET /superadmins/search?q=
  def search
    @query = params[:q]
    @superadmins = []
    if @query.present?
      @superadmins =  User.with_role(:superadmin).where("lower(first_name) LIKE ? OR lower(last_name) LIKE ?", "%#{@query.downcase}%", "%#{@query.downcase}%")
    else
      @superadmins = User.with_role(:superadmin).order('users.last_name, users.first_name')
    end
  end

  private

  def superadmin_params
    params.require(:user).permit(:email, :first_name, :last_name, :password, :biography, :avatar, :avatar_cache, :remove_avatar)
  end

end
