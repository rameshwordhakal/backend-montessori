# module Overrides
#   class RegistrationsController < DeviseTokenAuth::RegistrationsController
#     def create
#       if params[:role] == 'admin'
#         super do |resource|
#         end
#       # elsif !params[:role].empty?
#       #   @role = Role.find_by!(name: params[:role])
#       #   super do |resource|
#       #     resource.roles << @role
#       #   end
#       # else
#       #   super do |resource|
#       #   end
#       end
#     end
#   end
# end