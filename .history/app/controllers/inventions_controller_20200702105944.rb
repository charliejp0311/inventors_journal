class InventionsController < ApplicationController
    before_action :authenticate_user
    def index
        @inventions = Invention.all
    end
    
    def new
       @user = current_user
       @invention = Invention.new 
    end

    def show
        @invention = set_invention
    end
    def create
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
            category_ids:[],
            :category_params[
                :category
            ]
        )
    end
    def set_invention
        Invention.find_by(id: params[:id])
    end
end
