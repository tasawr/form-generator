class FormGroupAssignment < ActiveRecord::Base
  belongs_to :form_group
  belongs_to :form

  validates_presence_of :form_group_id, :form_id
end
