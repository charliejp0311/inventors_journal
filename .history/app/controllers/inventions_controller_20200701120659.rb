class InventionsController < ApplicationController
    def index
        @inventions = Invention.all
    end
    
    def new
       @user=User.find_by(session[:user_id])
       @invention = Invention.new 
    end
    def show
        @invention = set_invention
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
        ###need to make this user verified
        Invention.destroy(set_invention)
    end

    private
    def invention_params
        params.require(:invention).permit(:title,:goal, :description, :user_id)
    end
    def set_invention
        Invention.find_by(id: params[:id])
    end
end
