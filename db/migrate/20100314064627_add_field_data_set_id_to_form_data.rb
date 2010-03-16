class AddFieldDataSetIdToFormData < ActiveRecord::Migration
  def self.up
    add_column :form_datas, :form_data_set_id, :integer
  end

  def self.down
    remove_column :form_datas, :form_data_set_id
  end
end
