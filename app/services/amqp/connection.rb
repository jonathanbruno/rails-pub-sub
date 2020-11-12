module Amqp
  module Connection
    def self.build
      Bunny.new("amqp://#{ENV['RABBITMQ_DEFAULT_USER']}:#{ENV['RABBITMQ_DEFAULT_PASS']}@#{ENV['RABBITMQ_HOST']}").tap(&:start)
    end
  end
end
