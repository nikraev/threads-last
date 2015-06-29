require 'rubygems'
require 'mysql2'
require_relative './syslog.rb'

class UserRecords
  def initialize(host,port,database,username,password)
    #@host, @port, @database, @user, @password  = 'localhost', '3306', 'myapp', 'nkraev', 'nkraev'
    @host, @port, @database, @username, @password  = host, port, database, username, password
  end

#save user in database  
  def save(name,description,email,phone,address)
    self.checkConnectMySQL()     
    @connect.query("INSERT INTO users(name, description, email, phone, address) VALUES ( '#{name}', '#{description}', '#{email}','#{phone.to_s}','#{address}' )")
    
  end
  
  def update(name, data)
    self.checkConnectMySQL()    
    @connect.query("UPDATE user(#{data.key}) SET (#{data.values}) where name = #{name} ") 
    
  end
  
  def select(query)
    
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


LOG.info("Mysql Development")
user = UserRecords.new("127.0.0.1", 3306, 'myapp', 'nkraev', 'nkraev')
user.save("Kolia","User Kolia","nikraev@yandex.ru", "89057505045", "Slobodskoy streee 17. d 8")

