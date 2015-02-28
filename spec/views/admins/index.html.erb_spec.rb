require 'spec_helper'

describe "admins/index" do

  context "with 2 admins" do
    before(:each) do
      assign(:admins, [
        User.create!( :first_name => "Moe" , :last_name => "Sidgelack" , :email => "ms@email.com" , :password => "password" ),
        User.create!( :first_name => "Barney" , :last_name => "Gumble" , :email => "bg@email.com" , :password => "password" ),
      ])
    end

    # it "displays both admins" do
    #   render
    #
    #   expect(rendered).to match /Moe/
    #   expect(rendered).to match /Barney/
    # end
  end
end
