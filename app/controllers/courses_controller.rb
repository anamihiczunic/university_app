class CoursesController < ApplicationController
  skip_before_action :require_user

  def index
    @courses = Course.all
  end

  def new

  end

  def show
    @course = Course.find(params[:id])
  end
end