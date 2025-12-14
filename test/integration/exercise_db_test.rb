require "test_helper"

class ExercisesDatabaseTest < ActionDispatch::IntegrationTest
  test "exercise is saved and retrieved from the database" do
    exercise = Exercise.create!(
      name: "Bench Press",
      weight: 80,
      sets: 3,
      reps: 10,
      user: users(:one) # uses fixture user
    )

    found_exercise = Exercise.find_by(name: "Bench Press")

    assert_not_nil found_exercise
    assert_equal 80, found_exercise.weight
    assert_equal 3, found_exercise.sets
    assert_equal 10, found_exercise.reps
  end
end