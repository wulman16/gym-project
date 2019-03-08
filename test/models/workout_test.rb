require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

  test "should not save workout without user_id" do
    workout = Workout.new(name: "Upper Body A")
    assert_not workout.save, "Saved the workout without a user_id"
  end

  test "should not save workout without name" do
    workout = Workout.new(user_id: 1)
    assert_not workout.save, "Saved the workout without a name"
  end

end
