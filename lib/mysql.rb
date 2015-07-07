require 'rubygems'
require 'mysql2'
require_relative './syslog.rb'

class DataRecords
  def initialize(host,port,database,username,password)
    #@host, @port, @database, @user, @password  = 'localhost', '3306', 'myapp', 'nkraev', 'nkraev'
    @host, @port, @database, @username, @password  = host, port, database, username, password
  end

#users methodds
#save user in database  
  def saveUser(name,description,email,phone,address)
    self.checkConnectMySQL()     
    @connect.query("INSERT INTO users(name, description, email, phone, address) VALUES ( '#{name}', '#{description}', '#{email}','#{phone.to_s}','#{address}' )")    
  end
  
  def updateUser(name, data)
    self.checkConnectMySQL()    
    @connect.query("UPDATE user(#{data.key}) SET (#{data.values}) where name = #{name} ") 
  end
  
  def selectUser(query)
    
  end
#tweets methods
  def saveTweet(forum,message,userid)
     self.checkConnectMySQL()    
     @connect.query("INSERT INTO tweets(forum,message,userid) VALUES ( '#{forum}', '#{message}', '#{userid}')")
  end
  
  def updateTweets(forum,message,user,id)
  end
 protected 
  
  def connectMySql()    
    result = Mysql2::Client.new(:host => @host, :port => @port,:username => @username, :password => @password, :database => @database )
    result
  end
  
  def checkConnectMySQL()
    if !@connect
    @connect  = self.connectMySql()      
    end 
  end  
  
end


