class OrderProductSerializer < ProductSerializer
  cached

  def include_user?
    false
  end

  def cache_key
    [object, scope]
  end
end
