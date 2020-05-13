# frozen_string_literal: true
class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  layout :layout_by_resource

  def access_denied(exception)
    redirect_to(root_path, alert: exception.message)
  end

  def after_sign_in_path_for(resource)
    if resource.admin?
      bypass_sign_in(resource, scope: :admin_user)
      admin_root_path
    else
      root_path
    end
  end

  private

  def layout_by_resource
    devise_controller? ? 'devise' : 'application'
  end
end
