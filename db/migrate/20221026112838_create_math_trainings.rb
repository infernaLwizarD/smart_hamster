class CreateMathTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :math_trainings do |t|
      t.references :user, null: false, foreign_key: true
      t.text :operations, array: true, default: []
      t.integer :min_number, null: false, default: 0
      t.integer :max_number, null: false, default: 100
      t.integer :timer

      t.timestamps
    end
  end
end
