class UserSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :address, :gender, :contact, :role

    def role 
        object.role
    end
end