# require 'spec_helper'
#
# describe AdminsController do
#   login_superadmin
#
#   describe "GET #index" do
#     it "populates an array of admins" do
#       admin = FactoryGirl.create(:admin)
#       admin.add_role 'admin'
#       get :index
#       expect(assigns(:admins)).to eq([admin])
#     end
#     it "renders the :index view" do
#       get :index
#       expect(response).to render_template :index
#     end
#   end
#   describe "GET #show" do
#     it "assigns the requested student to @admin" do
#       admin = FactoryGirl.create(:admin)
#       admin.add_role 'admin'
#       get :show, id: admin
#       expect(assigns(:admin)).to eq(admin)
#     end
#     it "renders the #show view" do
#       admin = FactoryGirl.create(:admin)
#       admin.add_role 'admin'
#       get :show, id: admin
#       expect(response).to render_template :show
#     end
#   end
#   describe "GET #new" do
#     it "assigns a new Admin to @admin" do
#       get :new
#       expect(assigns(:admin).first_name).to eq(nil)
#       expect(assigns(:admin).last_name).to eq(nil)
#     end
#     it "renders the :new template" do
#       get :new
#       expect(response).to render_template :new
#     end
#   end
#   describe "POST #create" do
#     context "with valid attributes" do
#       it "creates a new admin" do
#         expect{
#           post :create, user: FactoryGirl.attributes_for(:user)
#         }.to change(User,:count).by(1)
#       end
#       it "saves the new admin in the database" do
#         expect{
#           post :create, user: FactoryGirl.attributes_for(:admin)
#         }.to change(User,:count)
#       end
#     end
#     context "with invalid attributes" do
#       it "does not save the new admin in the database" do
#         expect{
#           post :create, user: FactoryGirl.attributes_for(:invalid_admin)
#         }.to_not change(User,:count)
#       end
#       it "re-renders the :new template" do
#         get :new
#         expect(response).to render_template :new
#       end
#     end
#   end
#
#   describe 'PATCH #update' do
#     before :each do
#       @admin = FactoryGirl.create(:admin)
#     end
#     context "with valid attributes" do
#       it "locates the requested admin" do
#         patch :update, id: @admin, user: FactoryGirl.attributes_for(:admin)
#         expect(assigns(:admin)).to eq(@admin)
#       end
#       it "changes @admin's attributes" do
#         patch :update, id: @admin, user: FactoryGirl.attributes_for(:admin, first_name: 'Patty')
#         @admin.reload
#         expect(@admin.first_name).to eq('Patty')
#       end
#       it "redirects to the updated admin" do
#         patch :update, id: @admin, user: FactoryGirl.attributes_for(:admin)
#         expect(response).to redirect_to admin_path(@admin)
#       end
#     end
#     context "with invalid attributes" do
#       it "does not change the admin's attributes" do
#         patch :update, id: @admin, user: FactoryGirl.attributes_for(:admin)
#         @admin.reload
#         expect(@admin.name).to_not eq("Selma")
#       end
#       it "redirects to the updated admin" do
#         patch :update, id: @admin, user: FactoryGirl.attributes_for(:admin)
#         expect(response).to redirect_to admin_path(@admin)
#       end
#     end
#   end
#
#   describe 'DELETE #destroy' do
#     before :each do
#       @admin = FactoryGirl.create(:admin)
#     end
#     it "deletes the admin" do
#       expect {
#         delete :destroy, id: @admin
#       }.to change(User,:count).by(-1)
#     end
#     it "redirects to admins#index" do
#       delete :destroy, id: @admin
#       expect(response).to redirect_to admins_url
#     end
#   end
#
# end
