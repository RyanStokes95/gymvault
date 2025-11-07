class ExercisesController < ApplicationController
  # Ensure a user is logged in before accessing any action
  before_action :authenticate_user!

  # Find the exercise for actions that need an existing record
  before_action :set_exercise, only: %i[show edit update destroy]

  # GET /exercises
  # Displays all exercises that belong to the currently logged-in user
  def index
    @exercises = current_user.exercises
  end

  # GET /exercises/1
  # Shows details for a single exercise
  def show
  end

  # GET /exercises/new
  # Displays the form to create a new exercise
  def new
    # Builds a new exercise record tied to the current user
    @exercise = current_user.exercises.new
  end

  # GET /exercises/1/edit
  # Displays the form to edit an existing exercise
  def edit
  end

  # POST /exercises
  # Creates a new exercise and saves it to the database
  def create
    @exercise = current_user.exercises.new(exercise_params)

    respond_to do |format|
      if @exercise.save
        # Redirects to the list of exercises after successful creation
        format.html { redirect_to exercises_path, notice: "Exercise was successfully created." }
        format.json { render :show, status: :created, location: @exercise }
      else
        # Renders the 'new' form again if there were validation errors
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exercises/1
  # Updates an existing exercise record
  def update
    respond_to do |format|
      if @exercise.update(exercise_params)
        # Redirects back to the list after successful update
        format.html { redirect_to exercises_path, notice: "Exercise was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @exercise }
      else
        # Renders the edit form again if something went wrong
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @exercise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exercises/1
  # Deletes an exercise from the database
  def destroy
    @exercise.destroy!

    respond_to do |format|
      # After deletion, redirect to the list of exercises
      format.html { redirect_to exercises_path, notice: "Exercise was successfully deleted.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    # Finds the specific exercise based on the ID parameter,
    # but scoped to the current user to prevent accessing others' records
    def set_exercise
      @exercise = current_user.exercises.find(params[:id])
    end

    # Strong parameters: allow only safe, permitted fields
    def exercise_params
      params.require(:exercise).permit(:name, :weight, :sets, :reps)
    end
end
