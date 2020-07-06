class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :authenticate_user, :logged_in?, :current_user, :problem_has_solution?

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
      !!current_user
    end

    def authenticate_user
      redirect_to '/' unless logged_in?
    end

    def problem_has_solution?
      if self.solution
        render partial: 'views/inventions/solution_form', locals: {solution: prob.solution}
      else
        render partial: 'views/inventions/solution_form', locals: {solution: prob.solutions.build}
    end
end
