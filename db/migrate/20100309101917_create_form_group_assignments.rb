class CreateFormGroupAssignments < ActiveRecord::Migration
  def self.up
    create_table :form_group_assignments do |t|
      t.integer :form_group_id
      t.integer :form_id

      t.timestamps
    end
  end

  def self.down
    drop_table :form_group_assignments
  end
end
