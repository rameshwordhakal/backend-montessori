module Overrides
  class RegistrationsController < DeviseTokenAuth::RegistrationsController
    def create
        if current_user.role.role_name == 'admin'
            super do |resource|
                @user = User.new(user_params)
                # resource.role = Role.find(1)
                render json: @user, status: :created
            end

        elsif current_user.role.role_name == 'teacher' || current_user.role.role_name == 'parent'
            render json: {status: 'unauthorized'}
        end
    end
    def user_params
        params.permit(:name, :image, :created_at, :updated_at, :email, :role, :contact, :gender, :address)
    end
  end
end