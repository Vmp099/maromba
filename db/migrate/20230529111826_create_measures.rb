class CreateMeasures < ActiveRecord::Migration[7.0]
  def change
    create_table :measures do |t|
      t.float :new_measure
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
