# config/Rakefile

require 'bunny'

namespace :rabbitmq do
  desc 'Setup routing'
  task :setup do
    conn = Bunny.new("amqp://#{ENV['RABBITMQ_DEFAULT_USER']}:#{ENV['RABBITMQ_DEFAULT_PASS']}@#{ENV['RABBITMQ_HOST']}").tap(&:start)
    ch = conn.create_channel

    # ORDER.CANCELED
    ch.fanout('app.order.canceled')
    queue = ch.queue('notify_user', durable: true)
    queue.bind('app.order.canceled')

    queue = ch.queue('store_log', durable: true)
    queue.bind('app.order.canceled')


    # PRODUCT CHANGED
    ch.fanout('app.product.changed')
    queue = ch.queue('store_log', durable: true)
    queue.bind('app.product.changed')

    conn.close
  end
end
