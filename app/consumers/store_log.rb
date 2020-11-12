class StoreLog
  include Hutch::Consumer

  def process(message)
    # File.open("/var/www/app/aaa-#{Time.now.to_i}.txt", 'w') {|f| f.write(message) }
    # puts "Storing Log #{message}"
  end
end
