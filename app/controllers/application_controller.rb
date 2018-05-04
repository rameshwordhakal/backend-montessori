class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  include ActionController::Serialization
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected 
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :created_at, :updated_at, :email, :role, :contact, :gender, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :created_at, :updated_at, :email, :role, :contact, :gender, :address])    
  end

end
