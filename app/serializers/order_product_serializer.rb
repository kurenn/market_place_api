class OrderProductSerializer < ProductSerializer
  def include_user?
    false
  end
end
