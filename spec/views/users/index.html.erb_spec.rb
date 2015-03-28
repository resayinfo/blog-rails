require 'rails_helper'

RSpec.describe "users/index.html.erb", :type => :view do

  it "displays admins" do
    user = FactoryGirl.create(:user)
  end

end
