require 'rails_helper'

RSpec.describe Article, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:comment)).to be_valid
  end
  it "is invalid without a body" do
    expect(FactoryGirl.build(:comment, body: nil)).to be_invalid
  end

end
