class CancelOrdersController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    Amqp::Publisher.channel_publish('order.canceled', order.attributes)
    Amqp::Publisher.queue_publish('store_log', { message: 'my default delivery' })
    flash[:notice] = "Order #{order.final_number} Successfully canceled"
    redirect_to orders_path
  end
end
