class InventionsController < ApplicationController
    def index
        @inventions = Invention.all
    end
    
    def new
       @user = User.find_by(session[:user_id])
       @invention = Invention.new 
    end
    def show
        @invention = set_invention
    end
    def create
        byebug
        @invention = Invention.new(invention_params)
        if @invention.save && logged_in?
            redirect_to user_invention_path(current_user, @invention)
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
        params.require(:invention).permit(
            :title,
            :goal, 
            :description, 
            :user_id, 
            :category_id,
            :category_params[
                :category
            ]
        )
    end
    def set_invention
        Invention.find_by(id: params[:id])
    end
end
