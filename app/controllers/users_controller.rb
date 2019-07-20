class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
          @user.save
          session[:user_id] = @user.id
          redirect_to "/users/#{@user.id}"
        else
          render 'new'
        end
      end

      def show
        @user = User.find(params[:id])
        @articles = @user.articles
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
