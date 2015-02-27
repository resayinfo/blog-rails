require 'rails_helper'

RSpec.describe User, :type => :model do

    it "has a valid factory" do
      expect(FactoryGirl.create(:user)).to be_valid
    end
    it "is invalid without an email" do
      expect(FactoryGirl.build(:user, email: nil)).to be_invalid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:user, password: nil)).to be_invalid
    end


    it "has a valid factory" do
      expect(FactoryGirl.create(:admin_user)).to be_valid
    end
    it "is invalid without an email" do
      expect(FactoryGirl.build(:admin_user, email: nil)).to be_invalid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:admin_user, password: nil)).to be_invalid
    end


    it "has a valid factory" do
      expect(FactoryGirl.create(:superadmin_user)).to be_valid
    end
    it "is invalid without an email" do
      expect(FactoryGirl.build(:superadmin_user, email: nil)).to be_invalid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:superadmin_user, password: nil)).to be_invalid
    end


    it "has a valid factory" do
      expect(FactoryGirl.create(:god_user)).to be_valid
    end
    it "is invalid without an email" do
      expect(FactoryGirl.build(:god_user, email: nil)).to be_invalid
    end
    it "is invalid without a password" do
      expect(FactoryGirl.build(:god_user, password: nil)).to be_invalid
    end

end
