class FormGroupAssignmentsController < ApplicationController

  def create
    @assignment = FormGroupAssignment.new(params[:form_group_assignment])
    if @assignment.save
      notify_success :assigned, :group
    else
      notify_failure :assign, :group
    end

    redirect_to "#{forms_url}#form_#{@assignment.form_id}"
  end

  def destroy
    assignment = FormGroupAssignment.find(params[:id].to_i)
    if assignment.destroy
      notify_success :removed, :group_assignment
    else
      notify_failure :remove, :group_assignment
    end

    redirect_to "#{forms_url}#form_#{assignment.form.id}"
  end
end
