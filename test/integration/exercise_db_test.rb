require "test_helper"

#creates a new exercise and checks if it is saved and retrieved correctly from the database
#Created here
class ExercisesDatabaseTest < ActionDispatch::IntegrationTest
  test "exercise is saved and retrieved from the database" do
    exercise = Exercise.create!(
      name: "Bench Press",
      weight: 80,
      sets: 3,
      reps: 10,
      #uses user1 fixture
      user: users(:one)
    )

    # Check to see if the exercise was saved correctly
    found_exercise = Exercise.find_by(name: "Bench Press")

    assert_not_nil found_exercise
    assert_equal 80, found_exercise.weight
    assert_equal 3, found_exercise.sets
    assert_equal 10, found_exercise.reps
  end
end