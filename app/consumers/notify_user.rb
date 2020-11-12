class NotifyUser
  include Hutch::Consumer

  def process(message)
    # File.open("/var/www/app/aaa-#{Time.now.to_i}.txt", 'w') {|f| f.write(message) }
    # puts "#{self.class.name}#{message}"
    raise 'my custom error'
  rescue
    puts 'AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa'
    # requeue!
  end
end
