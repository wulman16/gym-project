require 'test_helper'

class WorkoutExerciseTest < ActiveSupport::TestCase

  test "should not save workout exercise without workout_id" do
    workout_exercise = WorkoutExercise.new(exercise_id: 1, sets: 3, reps: 5,
      weight: "10 lbs")
    assert_not workout_exercise.save, "Saved the workout exercise without a workout_id"
  end

  test "should not save workout exercise without exercise_id" do
    workout_exercise = WorkoutExercise.new(workout_id: 1, sets: 3, reps: 5,
      weight: "10 lbs")
    assert_not workout_exercise.save, "Saved the workout exercise without an exercise_id"
  end

  test "should not save workout exercise without sets" do
    workout_exercise = WorkoutExercise.new(workout_id: 1, exercise_id: 1, reps: 5,
      weight: "10 lbs")
    assert_not workout_exercise.save, "Saved the workout exercise without sets"
  end

  test "should not save workout exercise without reps" do
    workout_exercise = WorkoutExercise.new(workout_id: 1, exercise_id: 1, sets: 5,
      weight: "10 lbs")
    assert_not workout_exercise.save, "Saved the workout exercise without reps"
  end

  test "should not save workout exercise without weight" do
    workout_exercise = WorkoutExercise.new(workout_id: 1, exercise_id: 1, sets: 3,
      reps: 5)
    assert_not workout_exercise.save, "Saved the workout exercise without a weight"
  end

end
