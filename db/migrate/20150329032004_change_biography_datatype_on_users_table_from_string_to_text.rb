class ChangeBiographyDatatypeOnUsersTableFromStringToText < ActiveRecord::Migration

  def self.up
    change_column :users, :biography, :text
  end

  def self.down
    change_column :users, :biography, :string
  end

end
