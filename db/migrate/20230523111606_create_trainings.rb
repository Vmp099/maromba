class CreateTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :trainings do |t|
      t.string :name_training
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
