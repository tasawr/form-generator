class CreateFormElements < ActiveRecord::Migration
  def self.up
    create_table :form_elements do |t|
      t.string :field_type
      t.string :label
      t.boolean :required
      t.text :help

      t.timestamps
    end
  end

  def self.down
    drop_table :form_elements
  end
end
