class FormElementsController < ApplicationController

  def index
    load_field_types
    @form_element = FormElement.new
    @form_elements = FormElement.all
  end

  def create
    @form_element = FormElement.new(params[:form_element])
    if @form_element.save
      notify_success :added, :form_element
      redirect_to form_elements_url
    else
      notify_failure :add, :form_element
      load_field_types
      render :index
    end
  end

  def destroy
    form_element = FormElement.find(params[:id].to_i)
    if form_element.destroy
      notify_success :removed, :form_element
    else
      notify_failure :remove, :form_element
    end

    redirect_to form_elements_url
  end

  def edit
    load_field_types
    @form_element = FormElement.find(params[:id].to_i)
  end

  def update
    @form_element = FormElement.find(params[:id].to_i)
    if @form_element.update_attributes(params[:form_element])
      notify_success :updated, :form_element
      redirect_to form_elements_url
    else
      notify_failure :update, :form_element
      load_field_types
      render :action => :edit
    end
  end

  private
    def load_field_types
      @field_types = [:scale, :text]
    end
  
end
