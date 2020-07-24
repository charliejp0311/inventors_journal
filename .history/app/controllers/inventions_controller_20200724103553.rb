class InventionsController < ApplicationController
    before_action :authenticate_user, :set_invention
    skip_before_action :set_invention, only: [:index]
    skip_before_action :authenticate_user, only: [:index, :show, :stats]

    def index
        @user = current_user
        @inventions = Invention.all
    end
    
    def new
       @invention = current_user.inventions.build
    end

    def show
        @invention = set_invention
        @user = @invention.user
        session[:invention_id] = @invention.id
    end

    def stats
        i = 0
        inventors = Invention.user_invention_count
        @user_invention_count_hash = []
        3.times do
            @user_invention_count_hash<<inventors[i]
            i+=1 
        end
        c=0
        cats = Invention.category_invention_count
        @category_invention_count_hash = []
        3.times do
            @category_invention_count_hash<<cats[c]
            c+=1
        end
    end

    def create
        @invention = Invention.new(invention_params)
        ## creating category or finding
        if !params[:invention][:category].empty?
            category = Category.find_by(id: params[:invention][:category])
            @invention = category.inventions.build(invention_params)                       
        elsif params[:invention][:category_attributes]
            category = Category.find_or_create_by(category: params[:invention][:category_attributes][:category])
            @invention = category.inventions.build(invention_params)                       
        end
        ## test if valid if so create it
        if @invention.save
            redirect_to user_invention_path(current_user, @invention)
        else
            render 'new'
        end
    end

    def edit
        @invention = set_invention
        @user = @invention.user 
    end

    def update
        @invention = set_invention
        @invention.update(update_params)
        redirect_to user_invention_path(@invention.user, @invention)
    end

    def search
        byebug
    end
    ## move to its own controller
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
    ## move to its own controller
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
        invention = set_invention
        @user = invention.user
        if @user == current_user
            Invention.destroy(invention.id)
            redirect_to user_inventions_path(@user)
        else 
            redirect_to user_inventions_path(current_user)
        end
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

    def update_params
        params.require(:invention).permit(:description)
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

end
