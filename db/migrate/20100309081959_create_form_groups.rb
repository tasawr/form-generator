class CreateFormGroups < ActiveRecord::Migration
  def self.up
    create_table :form_groups do |t|
      t.string :label
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :form_groups
  end
end
