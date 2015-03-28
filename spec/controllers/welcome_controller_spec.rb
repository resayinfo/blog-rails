require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do
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

end
