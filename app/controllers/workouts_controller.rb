class WorkoutsController < ApplicationController

    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]
    
    def index
        @workouts = Workout.all
    end 

    def show 
        @workout = Workout.find(params[:id])
    end

    def new 
        @workout = Workout.new
    end 

    def create
        @workout = Workout.new(workout_params)
        @workout.user_id = session[:user_id]
        if @workout.valid?
            @workout.save
            redirect_to workout_path(@workout)
        else
            render :new
        end
    end

    def edit 
        @workout = Workout.find(params[:id])
    end 

    def update 
        @workout = Workout.find(params[:id])
        if @workout.valid?
         @workout.update(workout_params)
         redirect_to workout_path(@workout)
        else
            render :edit
        end 
    end 

    def destroy
        @workout = Workout.find(params[:id])
        @workout.destroy
        redirect_to user_path(session[:user_id])
    end 

    private 
    def workout_params
        params.require(:workout).permit(:name, :user_id, workout_exercises_attributes: [:exercise_id, :sets, :reps, :weight, :id])
    end

    def require_login
        return head(:forbidden) unless session.include?(:user_id)
    end
end
