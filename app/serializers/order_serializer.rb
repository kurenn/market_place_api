class OrderSerializer < ActiveModel::Serializer
  cached

  attributes :id, :total
  has_many :products, serializer: OrderProductSerializer

  def cache_key
    [object, scope]
  end
end
