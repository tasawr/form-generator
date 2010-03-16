class FormElement < ActiveRecord::Base

  has_many :group_element_assignments
  has_many :form_groups, :through => :group_element_assignments
  has_many :form_datas

  validates_presence_of :label

  TYPE_SCALE = 'scale'
  TYPE_TEXT = 'text'
end
