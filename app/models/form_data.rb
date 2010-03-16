class FormData < ActiveRecord::Base

  belongs_to :form
  belongs_to :form_element
  belongs_to :form_data_set
  named_scope :by_form_element_ids, lambda {|ids| 
    {:conditions => ['form_element_id IN (?)', ids]}
  }

  COLORS = ['lightYellow', 'lightYellow', '#FFFF88', '#FFFF88']

  serialize :hash_value

  def value(field_type)
    case field_type
      when FormElement::TYPE_SCALE
      self.int_value

      when FormElement::TYPE_TEXT
      self.fat_value
    end
  end

end
