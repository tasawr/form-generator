class FormData < ActiveRecord::Base

  belongs_to :form
  belongs_to :form_element
  belongs_to :form_data_set
  named_scope :by_form_element_ids, lambda {|ids| 
    {:conditions => ['form_element_id IN (?)', ids]}
  }

  COLORS = ['#CC0000', '#FF1A00', '#FF7400', '#C79810', '#73880A']

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
