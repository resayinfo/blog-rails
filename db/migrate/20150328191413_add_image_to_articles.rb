class AddImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :poster, :string
  end
end
