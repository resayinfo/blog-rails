require 'rails_helper'

RSpec.describe Article, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:article)).to be_valid
  end
  it "is invalid without a title" do
    expect(FactoryGirl.build(:article, title: nil)).to be_invalid
  end
  it "is invalid without text" do
    expect(FactoryGirl.build(:article, text: nil)).to be_invalid
  end

end
