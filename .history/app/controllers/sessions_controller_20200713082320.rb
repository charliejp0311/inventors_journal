class SessionsController < ApplicationController

    def new
        @user = User.new 
    end

    def create
        if auth_hash = request.env['omniauth.auth']
            byebug
            if @user = User.find_by(email: auth_hash[:info][:email])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                @user = User.new(email: auth_hash[:info][:info], password: SecureRandom.hex)
                redirect_to user_path(@user)
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
        session.clear
        redirect_to root_path
    end
end