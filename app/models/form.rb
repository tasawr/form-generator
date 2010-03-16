class Form < ActiveRecord::Base

  has_many :form_group_assignments
  has_many :form_groups, :through => :form_group_assignments
  has_many :form_datas
  has_many :form_data_sets

  validates_presence_of :title
end
