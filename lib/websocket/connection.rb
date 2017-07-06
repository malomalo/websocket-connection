require 'socket'
require 'websocket/driver'

class WebSocket::Connection
  
  attr_reader :url
  
  def initialize(url, options = {})
    @url = url
    @driver = ::WebSocket::Driver.client(self, options)
  end
  
  def self.start(url, options = {})
    connection = self.new(url, options)
    connection.start
    connection
  end
  
  def connect
    uri = URI.parse(url)
    @stream = ::Socket.tcp(uri.host, uri.port)
    @driver.start
  end
  alias_method :start, :connect
  
  def close
    @driver.close
    @stream.close
  end
  
  def closed?
    @stream.closed?
  end
  
  def open?
    !@stream.closed?
  end
  
  def state
    @driver.state
  end
  
  def on(event, callable = nil, &block)
    @driver.on(event, callable, &block)
  end
  
  def send(message)
    case message
      when Numeric then @driver.text(message.to_s)
      when String  then @driver.text(message)
      when Array   then @driver.binary(message)
      else false
    end
  end
  
  def write(data)
    @stream.write(data)
  end
  
  def read
    @driver.parse(@stream.readpartial(256))
  rescue EOFError, IOError
  end

  
end
