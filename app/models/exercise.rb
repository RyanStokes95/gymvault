class Exercise < ApplicationRecord
  belongs_to :user

  validates :name, :weight, :sets, :reps, presence: true
end
