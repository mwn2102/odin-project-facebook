class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end
    
    def show
        # @user = User.find(params[:id])
        @user = current_user
    end
  
end
