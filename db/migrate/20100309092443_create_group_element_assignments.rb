class CreateGroupElementAssignments < ActiveRecord::Migration
  def self.up
    create_table :group_element_assignments do |t|
      t.integer :form_group_id
      t.integer :form_element_id

      t.timestamps
    end
  end

  def self.down
    drop_table :group_element_assignments
  end
end
