class AddRoutineToTraining < ActiveRecord::Migration[7.0]
  def change
    add_reference :trainings, :routine, null: false, foreign_key: true
  end
end
