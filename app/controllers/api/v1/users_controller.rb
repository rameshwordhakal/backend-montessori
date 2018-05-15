class Api::V1::UsersController < ApplicationController
    
    before_action :authenticate_user!
    #GET /users
    def index
        if !current_user.role.role_name == 'admin'
            render json: { status: 'unauth' }           
        else
            @users = User.all
            render json: @users
        end
    end

end