# config/Rakefile

require 'bunny'

namespace :rabbitmq do
  desc 'Setup routing'
  task :setup do
    conn = Bunny.new("amqp://#{ENV['RABBITMQ_DEFAULT_USER']}:#{ENV['RABBITMQ_DEFAULT_PASS']}@#{ENV['RABBITMQ_HOST']}").tap(&:start)
    ch = conn.create_channel

    puts(' get or create exchange')
    ch.fanout('app.order.canceled')

    puts(' get or create queue (note the durable setting)')
    queue = ch.queue('notify_user', durable: true)

    puts(' bind queue to exchange')
    queue.bind('app.order.canceled')

    conn.close
  end
end
