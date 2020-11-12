class Product < ApplicationRecord
  after_commit :publish_product_changed

  def publish_product_changed
    Amqp::Publisher.publish('product.changed', attributes)
  end
end
