class GroupElementAssignment < ActiveRecord::Base

  belongs_to :form_group
  belongs_to :form_element

  validates_presence_of :form_group_id, :form_element_id

end
