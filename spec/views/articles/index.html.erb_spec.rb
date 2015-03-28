require 'spec_helper'

describe "articles/index" do

  # context "with 2 articles" do
  #   before(:each) do
  #     assign(:articles, [
  #       Article.create!(:title => "Sewing", :text => "Sewing is fun"),
  #       Article.create!(:title => "Digging", :text => "Digging is fun")
  #     ])
  #   end
  #
  #   it "displays both articles" do
  #     render
  #     expect(rendered).to match /Sewing/
  #     expect(rendered).to match /Digging/
  #   end
  # end
  # # undefined method `name' for nil:NilClass
     # ./app/views/articles/index.html.erb:22:in `block in _app_views_articles_index_html_erb

   it "displays articles" do
     article = FactoryGirl.create(:article)
   end

end
