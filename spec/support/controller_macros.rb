module ControllerMacros

  def login_god
    before(:each) do
      user = FactoryGirl.create(:god_user)
      sign_in user
    end
  end

end
