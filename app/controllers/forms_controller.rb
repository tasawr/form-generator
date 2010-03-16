class FormsController < ApplicationController

  def index
    @form = Form.new
    @forms = Form.all
    @groups = FormGroup.all
  end

  def create
    @form = Form.new(params[:form])
    if @form.save
      notify_success :added, :form
      redirect_to forms_url
    else
      notify_failure :add, :form

      @forms = Form.all
      @groups = FormGroup.all
      render :action => :index
    end
  end

  def destroy
    form = Form.find(params[:id].to_i)
    if form.destroy
      notify_success :removed, :form
    else
      notify_failure :remove, :form
    end

    redirect_to forms_url
  end

  def show
    @form = Form.find(params[:id].to_i)
    @ratings = FormDataSet::SCALE_TYPES
  end

  def edit
    @form = Form.find(params[:id].to_i)
  end

  def update
    @form = Form.find(params[:id].to_i)
    if @form.update_attributes(params[:form])
      notify_success :updated, :form
      redirect_to forms_url
    else
      notify_failure :update, :form
      render :edit
    end
  end
end
