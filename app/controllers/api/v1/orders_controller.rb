class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_with_token!
  respond_to :json

  def index
    orders = current_user.orders.page(params[:page]).per(params[:per_page])
    render json: orders, meta: pagination(orders, params[:per_page])
  end

  def show
    respond_with current_user.orders.find(params[:id])
  end

  def create
    order = current_user.orders.build
    order.build_placements_with_product_ids_and_quantities(params[:order][:product_ids_and_quantities])

    if order.save
      order.reload #we reload the object so the response displays the product objects
      OrderMailer.send_confirmation(order).deliver
      render json: order, status: 201, location: [:api, current_user, order]
    else
      render json: { errors: order.errors }, status: 422
    end
  end

end
