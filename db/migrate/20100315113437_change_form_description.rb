class ChangeFormDescription < ActiveRecord::Migration

  def self.up
    change_column :forms, :description, :text
  end

  def self.down
    change_column :forms, :description, :string
  end
end
