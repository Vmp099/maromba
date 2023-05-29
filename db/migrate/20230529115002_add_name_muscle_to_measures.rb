class AddNameMuscleToMeasures < ActiveRecord::Migration[7.0]
  def change
    add_column :measures, :name_muscle, :string
  end
end
