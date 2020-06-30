class CreateInventions < ActiveRecord::Migration[6.0]
  def change
    create_table :inventions do |t|
      t.string :title
      t.string :goal
      t.stringuser_id :description

      t.timestamps
    end
  end
end
