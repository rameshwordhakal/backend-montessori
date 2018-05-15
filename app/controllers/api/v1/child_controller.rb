class Api::V1::ChildController < ApplicationController
    before_action :child_find, only: [:update, :show, :destroy]
    before_action :authenticate_user!
    before_action :authenticate_admin
    def index
        @children = Child.where(user_id: current_user.id)
        render json: @children   
    end

    def show
        render json: @child    
    end

    def create
        @child = Child.new(child_params)
        if @child.save
            render json: @child, status: :created
        else
            render json: @child.errors, status: :unprocessable_entity
        end
    end

    def update
        if @child.update(child_params)
            render json: @child
        else
            render json: @child.errors, status: :unprocessable_entity
        end
    end

    def destroy
        if @child.present?
            @child.destroy
        end
        render json: {status: "deleted"}
    end

    
    private
        def child_find
            @child = Child.find(params[:id])         
        end
        
        def child_params
            params.permit(:name, :gender, :dob, :joined_date).merge(user_id: current_user.id)
        end
        
        def authenticate_admin
            render json: {status: 'unauthorized'},status: 403 unless current_user.role.role_name == 'admin'
        end
end
