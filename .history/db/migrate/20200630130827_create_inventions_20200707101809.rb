class CreateInventions < ActiveRecord::Migration[6.0]
  def change
    create_table :inventions do |t|
      t.string :title
      t.string :goal
      t.string :description
      t.integer :user_id
      t.integer :category_id
      
      t.timestamps
    end
  end
end
