require 'spec_helper'

describe "superadmins/index" do

  it "displays superadmins" do
    user = FactoryGirl.create(:superadmin_user)
  end

end
