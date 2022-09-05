# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :entrance_at, :ronin, :anonymous_high_school,
                                                       :university_id, :high_school_id, :join_club_at,
                                                       :leave_club_at, :club_frequency])
  end

  def after_sign_in_path_for(resource)
    subjects_index_path
  end
end
