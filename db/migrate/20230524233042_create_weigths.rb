class CreateWeigths < ActiveRecord::Migration[7.0]
  def change
    create_table :weigths do |t|
      t.float :last_weigth
      t.references :training, null: false, foreign_key: true

      t.timestamps
    end
  end
end
