class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :authenticate_user, :logged_in?, :current_user, :invention_problems, :problem_solution

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end

    def authenticate_user
      redirect_to '/' unless logged_in?
    end

    def invention_problems
      @invention_problems ||= Problem.where(invention_id: params[:id])      
    end

    def problem_solution
      if !problem.solutions.empty?
        render partial: 'views/inventions/solution_form', locals: {solution: problem.solutions.first}
      else
        render partial: 'views/inventions/solution_form', locals: {solution: problem.solutions.build} 
      end
    end
end
