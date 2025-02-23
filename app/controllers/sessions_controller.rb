class SessionsController < ApplicationController

    def new
    end 

    def create
        @user = User.find_by(name: params[:user][:name])
        if !@user.nil?
            if @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to '/'
            end 
        else  
            redirect_to '/login'
        end 
    end
end
