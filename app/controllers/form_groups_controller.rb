class FormGroupsController < ApplicationController

  def index
    @form_group = FormGroup.new
    @form_groups = FormGroup.all
    @form_elements = FormElement.all
  end

  def create
    @form_group = FormGroup.new(params[:form_group])
    if @form_group.save
      notify_success :added, :form_group
      redirect_to form_groups_url
    else
      notify_failure :add, :form_group
      @form_groups = FormGroup.all
      render :action => :index
    end
  end

  def destroy
    form_group = FormGroup.find(params[:id].to_i)
    if form_group.destroy
      notify_success :removed, :group
    else
      notify_failure :remove, :group
    end

    redirect_to form_groups_url
  end

  def edit
    @form_group = FormGroup.find(params[:id].to_i)
  end

  def update
    @form_group = FormGroup.find(params[:id].to_i)
    if @form_group.update_attributes(params[:form_group])
      notify_success :updated, :form_group
      redirect_to form_groups_url
    else
      notify_failure :update, :form_group
      render :edit
    end
  end

end
