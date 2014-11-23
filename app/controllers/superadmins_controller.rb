class SuperadminsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :superadmin, class: 'User'

  def index
    @superadmins = User.with_role(:superadmin).order('users.last_name, users.first_name')
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
      params[:user].delete :password
    end

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

  private

  def superadmin_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end
