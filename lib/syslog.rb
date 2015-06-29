require 'syslog/logger'

LOG = Syslog::Logger.new 'aisle'
LOG.level = Logger::INFO
