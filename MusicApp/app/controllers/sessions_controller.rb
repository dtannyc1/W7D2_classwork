class SessionsController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def create
        email = params[:user][:email]
        password = params[:user][:email]

        @user = User.find_by_credentials(email, password)

        if @user
            login!(@user)
            redirect_to user_url(@user)
        else
            @user = User.new
            flash.now[:errors] = ["Invalid Credentials"]
            render :new
        end
    end

    def destroy
        logout!
        # flash successful logout?
        flash.now[:messages] = ["Logout Successful!"]
        render :new # redirect to login page?
    end
end
