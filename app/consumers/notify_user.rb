class NotifyUser
  include Hutch::Consumer

  def process(message)
    # File.open("/var/www/app/aaa-#{Time.now.to_i}.txt", 'w') {|f| f.write(message) }
    puts "AAAAAAAAAAAAAAAAAAAAAAAAAaa#{message}"
  end
end
