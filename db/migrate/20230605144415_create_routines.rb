class CreateRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :routines do |t|
      t.string :routine_select

      t.timestamps
    end
  end
end
