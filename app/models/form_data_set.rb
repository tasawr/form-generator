class FormDataSet < ActiveRecord::Base

  SCALE_TYPES = [['Select', 0],
                ['Not Satisfactory', 1],
                ['Met Expectations', 2],
                ['Good Performance', 3],
                ['Outstanding Performance', 4]]

  attr_accessor :field_errors

  belongs_to :form
  has_many :form_datas
  has_many :forms, :through => :form_datas

  validates_presence_of :email

  def valid_fields?(fields)
    @field_errors = {}
    (fields || []).first.each do |f, v|
      ensure_valid_field(f, v)
    end

    @field_errors.empty?
  end

  def error_on_field(field)
    return (@field_errors ||= {})[field]
  end

  def save_with_fields(fields)
    saved = self.save

    if saved
      (fields || []).first.each do |f, v|
        form_element = detect_form_element(f)
        form_data = FormData.new(
            :form_id => self.form_id,
            :form_element_id => form_element.id,
            :form_data_set_id => self.id)

        case form_element.field_type.downcase
          when 'scale'
          form_data.int_value = v.to_i

          when 'text'
          form_data.fat_value = v
        end

        saved = form_data.save
      end

      return saved
    else
      return false
    end
  end

  private
    def ensure_valid_field(field, value)
      form_element = detect_form_element(field)

      case form_element.field_type.downcase
        when 'scale'
        if form_element.required?
          if value.to_i == 0
            @field_errors[field] = 'select your rating'
          end
        end

        when 'text'
        if form_element.required?
          if value.nil? || value.empty?
            @field_errors[field] = 'empty content is not allowed'
          end
        end
      end
    end

    def detect_form_element(field)
      string_parts = field.split(/_/)
      FormElement.find(string_parts.last.to_i)
    end

end
