class AdminsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :admin, class: 'User'

  def index
    @admins = User.with_role(:admin).order('users.last_name, users.first_name')
  end

  def show
    @admin = User.find(params[:id])
  end

  def new
    @admin = User.new
    @admin.add_role :admin
  end

  def edit
    @admin = User.find(params[:id])
  end

  def create
    @admin = User.new(admin_params)
    # @admin.password = Devise.friendly_token.first(8)

    respond_to do |format|
      if @admin.save
        @admin.add_role :admin
        format.html { redirect_to admin_path(@admin), notice: 'Administator was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def update
    @admin = User.find(params[:id])

    if params[:user][:password].empty?
      params[:user].delete :password
    end

    respond_to do |format|
      if @admin.update_attributes(admin_params)
        format.html { redirect_to admin_path(@admin), notice: 'Administator was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @admin = User.find(params[:id])
    @admin.destroy

    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Administrator was successfully deleted.' }
    end
  end

  private

  def admin_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end

end