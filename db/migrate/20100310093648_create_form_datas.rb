class CreateFormDatas < ActiveRecord::Migration
  def self.up
    create_table :form_datas do |t|
      t.integer :form_id
      t.integer :form_element_id
      t.integer :int_value
      t.string :slim_value
      t.text :fat_value
      t.text :hash_value

      t.timestamps
    end
  end

  def self.down
    drop_table :form_datas
  end
end
