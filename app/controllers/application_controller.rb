class ApplicationController < ActionController::Base
  def redirect_to_courses
    redirect_to courses_path
  end
end
