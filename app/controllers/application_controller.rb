class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource

  protected
  def layout_by_resource
    module_name = self.class.name.split("::").first
    if devise_controller? || module_name == "Admin"
      "admin"
    else
      "application"
    end
  end

end
