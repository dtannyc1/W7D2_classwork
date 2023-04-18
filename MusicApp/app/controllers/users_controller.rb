class UsersController < ApplicationController
    def new
        @user = User.new

        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            # maybe flash some errors here
            render :new
        end
    end

    def show
        @user = User.find_by(params[:id])

        render :show
    end
end
