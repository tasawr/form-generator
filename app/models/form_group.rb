class FormGroup < ActiveRecord::Base

  has_many :group_element_assignments
  has_many :form_elements, :through => :group_element_assignments

  has_many :form_group_assignments
  has_many :forms, :through => :form_group_assignments

  validates_presence_of :label

end
