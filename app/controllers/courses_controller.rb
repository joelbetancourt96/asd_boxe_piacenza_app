class CoursesController < ApplicationController
  def index
    @courses = Course.all.order(:start_time)
  end
end
