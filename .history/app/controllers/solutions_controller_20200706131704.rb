class SolutionsController < ApplicationController

  def create
    @invention = Invention.find_by(id: params[:invention_id])
  end

  private
  def solution_params
    params.require(:solution).permit(:solution, :invention_id)
  end
end
