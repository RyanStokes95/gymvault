require "test_helper"

class ExerciseTest < ActiveSupport::TestCase
  test "exercise is valid with all attributes" do
    user = User.create!(email: "test@gymvault.com", password: "password123")
    exercise = user.exercises.new(name: "Bench Press", weight: 60, sets: 3, reps: 10)
    assert exercise.valid?
  end

test "exercise is invalid without a name" do
    user = User.create!(email: "test@gymvault.com", password: "password123")
    exercise = user.exercises.new(weight: 60, sets: 3, reps: 10)
    assert_not exercise.valid?
  end
end
