require "socket"
require_relative "secrets"

i_am_rails = TCPSocket.open(SERVER_IP,SERVER_PORT)
puts("IAMRAILS: sending command 0")
i_am_rails.puts("0")
data_from_the_data_service = i_am_rails.gets
puts("IAMRAILS: Recvd data back! [#{data_from_the_data_service}]")