class RemoveAuthorAndCommenterColumns < ActiveRecord::Migration
  def change
    remove_column :articles, :author
    remove_column :comments, :commenter
  end
end
