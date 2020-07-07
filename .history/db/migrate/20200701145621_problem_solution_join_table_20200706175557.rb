class ProblemSolutionJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :problem_solutions do |t|
      t.integer :problem_id 
      t.integer :solution_id 
    end
  end
end
