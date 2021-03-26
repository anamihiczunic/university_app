class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :show]
  skip_before_action :require_user, only: [:new, :create]
  before_action :require_same_user , only: [ :edit, :update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "You have successfully signed up."
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      flash[:notice] = "You have successfully updated your profile"
      redirect_to @student
      #redirect_to student_path(@student)
    else
      render 'edit'
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def require_same_user
    if  @student != current_user
      flash[:alert] = "You can only edit or delete your own account."
      redirect_to student_path(current_user)
    end
  end

end