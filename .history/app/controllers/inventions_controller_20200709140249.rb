class InventionsController < ApplicationController
    before_action :authenticate_user
    skip_before_action :authenticate_user, only: [:index, :show]

    def index
        @user = current_user
        @inventions = Invention.all
    end
    
    def new
       @user = current_user
       @invention = Invention.new 
    end

    def show
        @user = current_user
        @invention = set_invention
        session[:invention_id] = @invention.id
    end

    def create
        @invention = Invention.new(invention_params)
        ## creating category or finding
        create_or_find_category(@invention)
        ## test if valid if so create it
        if @invention.save
            redirect_to user_invention_path(current_user, @invention)
        else
            render 'new'
        end

    end

    def create_prob
        if session[:invention_id]
            @invention = Invention.find_by(id: session[:invention_id])
            if current_user == @invention.user
                problem = @invention.problems.build(problem_params)
                if problem.save
                    redirect_to user_invention_path(@invention.user, @invention)
                else
                    session[:flash] = @invention.errors
                    redirect_to user_invention_path(@invention.user, @invention)
                end
            else 
                redirect_to user_inventions_path(current_user)
            end
        else
            redirect_to inventions_path
        end
    end

    def create_solution
        if session[:invention_id]
            @invention = Invention.find_by(id: session[:invention_id])
            if current_user == @invention.user
                solution = Solution.new(solution_params) 
                if solution.save
                    redirect_to user_invention_path(@invention.user, @invention)
                else
                    session[:flash] = @invention.errors
                    redirect_to user_invention_path(@invention.user, @invention)
                end
            else 
                redirect_to user_inventions_path(current_user)
            end
            
        else
           redirect_to inventions_path 
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
    def problem_params
        params.require(:problem).permit(:problem)
    end
    def set_invention
        Invention.find_by(id: params[:id])
    end
    def solution_params
        params.permit(:solution, :problem_id)
    end


    def create_or_find_category(invention)
        if !!params[:category_id] && !params[:category_id].empty?
            invention.category = Category.find_by(id: params[:category_id])            
        elsif params[:category_attributes]
            invention.category = Category.find_or_create_by(category: params[:category_attributes][:category])
        end
    end
end
