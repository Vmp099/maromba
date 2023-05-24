class CreateRepeters < ActiveRecord::Migration[7.0]
  def change
    create_table :repeters do |t|
      t.integer :count

      t.timestamps
    end
  end
end
