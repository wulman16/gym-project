class ExercisesController < ApplicationController

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to user_path(session[:user_id])
    else
      @message = "Exercise already exists."
      render 'new'
    end
  end

  def exercise_params
    params.require(:exercise).permit(:name)
  end

end
