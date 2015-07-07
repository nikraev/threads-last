require 'bunny'

class RabbitQueue
  def initialize(host, queue)
    @host = host
    @queue = queue
  end
  
  def getData()
      
      self.getChannel() unless @channel
      
      puts @channel
      
      
      queue = @channel.queue(@queue)
      queue.subscribe(:block => true) do |delivery_info, properties, body|
      body << body.to_s
      end  
    
  end
  
protected 

  def getChannel
    #if(!connect = self.connectRabbitMQ())    
       connect=self.connectRabbitMQ()
       @channel = connect.create_channel
       
    #end   
    
   
  end
  
  def connectRabbitMQ()
    connect = Bunny.new
    connect.start
    return connect 
  end
end

r = RabbitQueue.new('localhost','user')
body = r.getData()
puts body
