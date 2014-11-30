class OrderSerializer < ActiveModel::Serializer
  attributes :id, :total
  has_many :products, serializer: OrderProductSerializer
end
