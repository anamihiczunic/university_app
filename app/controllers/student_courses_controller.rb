class StudentCoursesController < ApplicationController

  def create
    current_course= Course.find(params[:course_id])
    unless current_user.courses.include?(current_course)
      StudentCourse.create(student_id: current_user.id, course_id: current_course.id)
      flash[:notice] = "You have successfully enrolled in #{current_course.name}."
      redirect_to current_user
    else
        flash[:notice] = "Something was wrong with your enrollment."
        redirect_to root_path
    end
  end

end