class FormDataSetsController < ApplicationController

  def create
    @form_data_set = FormDataSet.new(params[:form_data_set])
    fields = params[:fields]

    if @form_data_set.valid? &&
        @form_data_set.valid_fields?(fields) &&
        @form_data_set.save_with_fields(fields)
      notify_success :saved, :form_data
      flash[:success] = "We've received your submission!."
      redirect_to form_url(@form_data_set.form.id)
    else
      notify_failure :save, :form_data
      @form = @form_data_set.form
      @ratings = FormDataSet::SCALE_TYPES
      @fields_data = params[:fields]
      render :action => '../forms/show.html.erb'
    end
  end

  def report
    @form = Form.find(params[:id].to_i)
    @grouped_elements = prepare_grouped_data(@form)
  end

  private
    def prepare_grouped_data(form)
      grouped_elements = {}
      form.form_groups.each do |group|
        grouped_elements[group] = group.form_elements
      end

      grouped_elements
    end

end
