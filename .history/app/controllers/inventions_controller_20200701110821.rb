class InventionsController < ApplicationController
    def index
        @inventions = Invention.all
    end
    def new
       @invention = Invention.new 
    end
    def create
        @invention = Invention.new(invention_params)
        if @invention.save
            redirect_to invention_path(@invention)
        else
            render 'new'
        end
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
