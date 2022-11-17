class CreateExamples < ActiveRecord::Migration[7.0]
  def change
    create_table :examples do |t|
      t.references :math_training, null: false, foreign_key: true
      t.text :example
      t.string :user_result
      t.string :correct_result
      t.datetime :end_time

      t.timestamps
    end
  end
end
