class StudentCoursesController < ApplicationController
  
  def create
    course = Course.find(params[:course_id])

    unless current_user.courses.include?(course)
      StudentCourse.create(course: course, student: current_user)
      flash[:notice] = "You have successfully enrolled in #{course.name}"
      redirect_to current_user
    else
      flash[:notice] = "Something went wrong with your enrollment"
      redirect_to root_path 
    end
  end
  
end