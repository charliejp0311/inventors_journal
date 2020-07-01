class AddColumnInventions < ActiveRecord::Migration[6.0]
  def change
    add_column :inventions, :category_id, :integer
  end
end
