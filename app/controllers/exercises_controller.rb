class ExercisesController < ApplicationController

  def index
    @exercises = Exercise.all.sort
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    if @exercise.save
      redirect_to exercises_path
    else
      @message = "Exercise already exists."
      render 'new'
    end
  end

  def exercise_params
    params.require(:exercise).permit(:name)
  end

end
