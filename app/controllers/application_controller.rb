# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  layout 'basic'

  def notify_success(type, model)
    flash[:success] = "Successfully #{type.to_s} #{model.to_s.humanize}"
  end

  def notify_failure(type, model)
    flash[:notice] = "Failed to #{type.to_s} #{model.to_s.humanize}"
  end
end
