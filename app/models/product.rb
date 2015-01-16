class Product < ActiveRecord::Base
  validates :title, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, 
                    presence: true

  has_many :placements
  has_many :orders, through: :placements

  belongs_to :user

  scope :filter_by_title, lambda { |keyword|
    where("lower(title) LIKE ?", "%#{keyword.downcase}%" ) 
  }

  scope :above_or_equal_to_price, lambda { |price| 
    where("price >= ?", price) 
  }

  scope :below_or_equal_to_price, lambda { |price| 
    where("price <= ?", price) 
  }

  scope :recent, -> {
    order(:updated_at)
  }

  def self.search(params = {})
    products = params[:product_ids].present? ? Product.where(id: params[:product_ids]) : Product.all

    products = products.filter_by_title(params[:keyword]) if params[:keyword]
    products = products.above_or_equal_to_price(params[:min_price].to_f) if params[:min_price]
    products = products.below_or_equal_to_price(params[:max_price].to_f) if params[:max_price]
    products = products.recent(params[:recent]) if params[:recent].present?

    products
  end

end
