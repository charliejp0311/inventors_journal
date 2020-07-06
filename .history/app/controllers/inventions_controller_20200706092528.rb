class InventionsController < ApplicationController
    before_action :authenticate_user
    before_action :invention_problems
    skip_before_action :authenticate_user, only: [:index, :show]
    skip_before_action :invention_problems, only: [:create, :new]
    def index
        @inventions = Invention.all
    end
    
    def new
       @user = current_user
       @invention = Invention.new 
    end

    def show
        @user = current_user
        @invention = set_invention
        @problems = invention_problems
        @problem = Problem.new
    end

    def create
        @invention = Invention.new(invention_params)
        ## creating category or finding
        if !!params[:category_id] && !params[:category_id].empty?
            @invention.category = Category.find_by(id: params[:category_id])            
        elsif params[:category_attributes]
            @invention.category = Category.find_or_create_by(category: params[:category_attributes][:category])
        end
        ## test if valid if so create it
        if @invention.save
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
            category_attributes: [
                :category
            ]
        )
    end
    def set_invention
        Invention.find_by(id: params[:id])
    end
end
