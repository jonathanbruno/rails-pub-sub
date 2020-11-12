module Amqp
  class Publisher
    # In order to publish message we need a exchange name.
    # Note that RabbitMQ does not care about the payload -
    # we will be using JSON-encoded strings
    def self.channel_publish(exchange, message = {})
      # grab the fanout exchange
      x = channel.fanout("app.#{exchange}")
      # and simply publish message
      x.publish(message.to_json)
    end

    def self.queue_publish(queue_name, message = {})
      # grab the queue
      q  = channel.queue(queue_name, durable: true)
      q.publish(message.to_json)
    end

    def self.channel
      @channel ||= connection.create_channel
    end

    # We are using default settings here
    # The `Bunny.new(...)` is a place to
    # put any specific RabbitMQ settings
    # like host or port
    def self.connection
      @connection ||= Connection.build
    end
  end
end