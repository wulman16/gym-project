require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase

  test "should not save exercise without name" do
    exercise = Exercise.new
    assert_not exercise.save, "Saved the exercise without a name"
  end

end
