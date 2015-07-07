require 'bunny'

class RabbitQueue
  def initialize(host, queue)
    @host = host
    @queue = queue
  end
  
  def getData()
      
      self.getChannel() unless @channel
      
      puts @channel
      
      message = Array.new()
      
      queue = @channel.queue(@queue)
      queue.subscribe(:block => true) do |delivery_info, properties, body|
      puts body.to_s
      body << body.to_s
      end  
      
      return message  
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
data = r.getData()
#puts body
