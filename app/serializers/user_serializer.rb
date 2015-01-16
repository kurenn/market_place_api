class UserSerializer < ActiveModel::Serializer
  cached

  embed :ids
  attributes :id, :email, :created_at, :updated_at, :auth_token

  has_many :products

  def cache_key
    [object, scope]
  end
end
