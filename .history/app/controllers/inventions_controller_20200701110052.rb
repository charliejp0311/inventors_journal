class InventionsController < ApplicationController
    def index
        @inventions = Invention.all
    end
    def new
        
    end
    def create
        
    end
    def destroy
        
    end

    private
    def invention_params
        params.require(:invention).permit(:title,:goal, :description, :user_id)
    end
    def set_invention
        Invention.find_by(id: params[:id])
    end
end
