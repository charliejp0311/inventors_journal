class CreateSolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :solutions do |t|
      t.string :solution
      t.integer :problem_id
      t.timestamps
    end
  end
end
