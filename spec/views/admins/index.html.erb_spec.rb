require 'spec_helper'

describe "admins/index" do

  it "displays admins" do
    user = FactoryGirl.create(:admin_user)
  end

end
