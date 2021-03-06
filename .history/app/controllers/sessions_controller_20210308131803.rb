class SessionsController < ApplicationController

    def new
        @user = User.new 
    end

    def create
        # byebug
        if auth_hash = request.env['omniauth.auth']
            if @user = User.find_by(email: auth_hash[:info][:email])
                session[:user_id] = @user.id 
                redirect_to user_path(@user)
            else
                @user = User.create(name: auth_hash[:info][:name], email: auth_hash[:info][:email], password: SecureRandom.hex)
                redirect_to user_path(@user)
            end
        else
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                flash[:alert] = 'Failed signin please ensure your eamil and password are correct'
                render 'new'
            end
        end
    end

    def destroy
        session.clear
        redirect_to root_path
    end
end