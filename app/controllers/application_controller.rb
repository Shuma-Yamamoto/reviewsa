# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,
                if: :devise_controller?
  before_action :user_info

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:name, :entrance_at, :ronin, :anonymous_high_school,
                                             :university_id, :high_school_id, :join_club_at,
                                             :leave_club_at, :club_frequency, :grade,
                                             { cram_histories_attributes: %i[cram_school_id join_at leave_at],
                                               subject_ids: [] }])
  end

  def after_sign_up_path_for(_resource)
    subjects_path
  end

  def after_sign_in_path_for(_resource)
    subjects_path
  end

  def authenticate_any!
    university_student_sineg_in? ? true : authenticate_examinee!
  end

  def user_info
    if university_student_signed_in?
      @univ_student = UniversityStudent.find(current_university_student.id)
    elsif examinee_signed_in?
      @examinee = Examinee.find(current_examinee.id)
    end
  end

  def search_books
    if params[:q].present?
      keywords = params[:q]['name_cont'].split(/[\p{blank}\s]+/)
      grouping_hash = keywords.reduce({}) { |hash, word| hash.merge(word => { name_cont: word }) }
      @q = @books.ransack({ combinator: 'and', groupings: grouping_hash })
    else
      @q = @books.ransack(params[:q])
    end
    @books = @q.result(distinct: true).page(params[:page]).per(7)
  end
end
