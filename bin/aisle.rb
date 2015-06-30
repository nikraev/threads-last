require 'daemons'
require_relative '../lib/syslog.rb'
require_relative '../lib/mysql.rb'
require_relative '../lib/rabbitmq.rb'

#превратили процесс в демона
Daemons.daemonize( :logfile_name =>'/home/nkraev/daemon.log', :app_name => "aisle" ) do

LOG.info("Start daemon")
LOG.info("Commit log")

#создние 5 исполнителей(клиентов)

5.times do |i|
  thread = Thread.new(LOG) do |log|
    log.info("Thread #{i+1} start !")
    
    #установить соединение с rabbitmq 
    #rabbit.connect
    #считать сообщение с очереди
    #забросить сообщение в БД
    #Цикл заново либо считать сообщение либо подождать сообщение 2 сек  
  end
end

#дожидаемся выполнения всех потоков кроме main
Thread.list.each {|t| t.join if t != Thread.main}

end
