class AddWeigthToTraining < ActiveRecord::Migration[7.0]
  def change
    add_column :trainings, :weigth, :float
  end
end
