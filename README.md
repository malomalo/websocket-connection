# websocket-connection

Create and use Websocket's without needing to use EventMachine.

# Usage

```ruby
require 'websocket/connection'

connection = WebSocket::Connection.start('ws://example.com')
connection.on(:message) do |event|
  puts event.data
  connection.close
end

connection.send("example message")

while connection.open?
  connection.read
end
```