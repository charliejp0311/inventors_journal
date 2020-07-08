class AddColumnToSolution < ActiveRecord::Migration[6.0]
  def change
    add_column :solutions, :invention_id, :integer
  end
end
