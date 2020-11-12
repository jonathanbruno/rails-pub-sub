class CancelOrdersController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    Amqp::Publisher.publish('order.canceled', order.attributes)
    flash[:notice] = "Order #{order.final_number} Successfully canceled"
    redirect_to orders_path
  end
end
