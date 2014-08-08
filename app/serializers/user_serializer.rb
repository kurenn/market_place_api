class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :updated_at, :auth_token
end
