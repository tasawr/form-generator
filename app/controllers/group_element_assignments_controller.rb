class GroupElementAssignmentsController < ApplicationController

  def create
    form_element_ids = params[:form_element_ids] || []
    if form_element_ids.empty?
      notify_failure :create, :group_element_assignment
      redirect_to :back
    else
      assignment = nil
      form_element_ids.each do |form_element_id|
        assignment = GroupElementAssignment.new(params[:group_element_assignment])
        assignment.form_element_id = form_element_id.to_i
        if assignment.save
          notify_success :assigned, :group_element
        else
          notify_failure :assign, :group_element
        end
      end

      redirect_to "#{form_groups_url}#form_group_#{assignment.form_group_id}"
    end
  end

  def destroy
    assignment = GroupElementAssignment.find(params[:id].to_i)
    if assignment.destroy
      notify_success :removed, :group_element_assignment
    else
      notify_failure :remove, :group_element_assignment
    end

    redirect_to "#{form_groups_url}#form_group_#{assignment.form_group_id}"
  end
end
