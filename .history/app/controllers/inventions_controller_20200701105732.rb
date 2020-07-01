class InventionsController < ApplicationController
    def index
        
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
end
