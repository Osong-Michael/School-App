class LoginsController < ApplicationController
  def new
    
  end

  def create
    student = Student.find_by(email: params[:logins][:email].downcase)
    if student && student.authenticate(params[:logins][:password])
      session[:student_id] = student.id
      flash[:notice] = "Successfully logged in"
      redirect_to student
    else
      flash.now[:notice] = "Something wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil 
    flash[:notice] = 'Logged out succesfully'
    redirect_to root_path
  end
  
  
  
end