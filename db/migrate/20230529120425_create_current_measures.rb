class CreateCurrentMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :current_measures do |t|
      t.float :measure_new
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
