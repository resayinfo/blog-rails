require 'spec_helper'

describe "articles/index" do

  context "with 2 articles" do
    before(:each) do
      assign(:articles, [
        Article.create!(:author => "Apu", :title => "Sewing", :text => "Sewing is fun"),
        Article.create!(:author => "Willy", :title => "Digging", :text => "Digging is fun")
      ])
    end

    it "displays both articles" do
      render
      expect(rendered).to match /Sewing/
      expect(rendered).to match /Digging/
    end
  end

end
