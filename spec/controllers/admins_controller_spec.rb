require 'rails_helper'

RSpec.describe AdminsController, :type => :controller do
  login_god

  it "renders the :index view" do
    get :index
    expect(response).to render_template :index
  end
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "renders the #show view" do
      user = FactoryGirl.create(:admin_user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new admin" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:superadmin_user)
        }.to change(User,:count).by(1)
      end
      it "saves the new admin in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:admin_user)
        }.to change(User,:count)
      end
    end
    context "with invalid attributes" do
      it "re-renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    before :each do
      @user = FactoryGirl.create(:admin_user)
    end
    context "with valid attributes" do
      it "locates the requested admin" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:admin_user)
        expect(assigns(:admin_user)).to eq(@admin)
      end
      it "changes @admin's attributes" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:admin_user, first_name: 'Maud')
        @user.reload
        expect(@user.first_name).to eq('Maud')
      end
      it "redirects to the updated admin" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:admin_user)
        expect(response).to redirect_to @admin
      end
    end
    context "with invalid attributes" do
      it "does not change the admin's attributes" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:admin_user)
        @user.reload
        expect(@user.name).to_not eq("Heather")
      end
      it "redirects to the updated admin" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:admin_user)
        expect(response).to redirect_to @admin
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user = FactoryGirl.create(:admin_user)
    end
    it "deletes the admin" do
      expect {
        delete :destroy, id: @user
      }.to change(User,:count).by(-1)
    end
    it "redirects to admins#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to admins_path
    end
  end

end
