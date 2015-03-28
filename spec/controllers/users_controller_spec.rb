require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
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
    it "assigns the requested user to @user" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(assigns(:user)).to eq(user)
    end
    it "renders the #show view" do
      user = FactoryGirl.create(:user)
      get :show, id: user
      expect(response).to render_template :show
    end
  end

  describe 'PATCH #update' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    context "with valid attributes" do
      it "locates the requested user" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(assigns(:user)).to eq(@user)
      end
      it "changes @user's attributes" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user, first_name: 'Maud')
        @user.reload
        expect(@user.first_name).to eq('Maud')
      end
      it "redirects to the updated user" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to user_path(@user)
      end
    end
    context "with invalid attributes" do
      it "does not change the user's attributes" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
        @user.reload
        expect(@user.name).to_not eq("Heather")
      end
      it "redirects to the updated user" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to user_path(@user)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @user = FactoryGirl.create(:user)
    end
    it "deletes the user" do
      expect {
        delete :destroy, id: @user
      }.to change(User,:count).by(-1)
    end
    it "redirects to users#index" do
      delete :destroy, id: @user
      expect(response).to redirect_to users_path
    end
  end

end
