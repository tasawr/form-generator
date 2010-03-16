class CreateFormDataSets < ActiveRecord::Migration
  def self.up
    create_table :form_data_sets do |t|
      t.string :email
      t.integer :form_id

      t.timestamps
    end
  end

  def self.down
    drop_table :form_data_sets
  end
end
