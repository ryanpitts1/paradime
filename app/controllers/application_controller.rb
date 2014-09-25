class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  
  def after_sign_in_path_for(resource)
    listings_manage_path
  end

  protected
  
  def layout_by_resource
    if (controller_name == 'sessions' || controller_name == 'registrations' || controller_name == 'passwords') && (action_name == 'new' || action_name == 'create' )
      "alternate"
    else
      "application"
    end
  end
end
