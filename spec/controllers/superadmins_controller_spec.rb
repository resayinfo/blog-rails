require 'rails_helper'

RSpec.describe SuperadminsController, :type => :controller do
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
      user = FactoryGirl.create(:superadmin_user)
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
      it "creates a new superadmin" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:superadmin_user)
        }.to change(User,:count).by(1)
      end
      it "saves the new superadmin in the database" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:superadmin_user)
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
      @user = FactoryGirl.create(:superadmin_user)
    end
    context "with valid attributes" do
      it "locates the requested superadmin" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:superadmin_user)
        expect(assigns(:superadmin_user)).to eq(@superadmin)
      end
      it "changes @superadmin's attributes" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:superadmin_user, first_name: 'Maud')
        @user.reload
        expect(@user.first_name).to eq('Maud')
      end
      it "redirects to the updated superadmin" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:superadmin_user)
        expect(response).to redirect_to @superadmin
      end
    end
    context "with invalid attributes" do
      it "does not change the superadmin's attributes" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:superadmin_user)
        @user.reload
        expect(@user.name).to_not eq("Heather")
      end
      it "redirects to the updated superadmin" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:superadmin_user)
        expect(response).to redirect_to @superadmin
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user = FactoryGirl.create(:superadmin_user)
    end
    it "deletes the superadmins" do
      expect {
        delete :destroy, id: @user
      }.to change(User,:count).by(-1)
    end
    it "redirects to superadmins#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to superadmins_path
    end
  end

end
