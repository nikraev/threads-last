require 'bunny'

class ImportData
  def initialize
    @host = 'localhost'
  end
  
  def insertUser(message)
    
  #check channel exist?
    if !@channel 
      @channel = self.connectionRabbit()
    end
    
    queue_user = @channel.queue("user")
    @channel.default_exchange.publish("", :routing_key => queue_user.name)
    
  end
  
  def connectionRabbit()
    connect = Bunny.new(:host => @host)
    connect.start
    channel = connect.create_channel
    channel
  end
end

rabbit = ImportData.new


1000.times do |i|
rabbit.insertUser("nikraev #{i},nikraev@yandex.ru")
end
puts "Import complite"
exit
