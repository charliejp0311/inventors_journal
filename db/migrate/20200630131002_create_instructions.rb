class CreateInstructions < ActiveRecord::Migration[6.0]
  def change
    create_table :instructions do |t|
      t.string :description
      t.integer :invention_id
      t.integer :user_id

      t.timestamps
    end
  end
end
