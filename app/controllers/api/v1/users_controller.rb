class Api::V1::UsersController < ApplicationController
    
    before_action :authenticate_user!
    #GET /users
    def index
        @users = User.all
        render json: @users             
    end

end