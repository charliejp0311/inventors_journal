class SessionsController < ApplicationController
    def home
    end
    def new
        @user = User.new 
    end

    def create
        if auth_hash = request.env['omniauth.auth']
            if @user = User.find_by(email: auth_hash[:info][:email])
                session[:user_id] = @user.id 
            else

            end
        else
            @user = User.find_by(name: params[:name])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                render 'new'
            end
        end
    end

    def destroy
        session.delete :user_id
    end
end