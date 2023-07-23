require "socket"
require_relative "secrets"

class GreenHouseService
  # def data_retrieval(command)
  #   # needs to be separate from send_command - need to add 2 hour interval, method is called every 2 hours
  #   # if that's not what we want, can delete
  #   socket = open_socket
  #   puts("IAMRAILS: sending command #{command}")
  #   socket.puts(command)
  #   data_from_the_data_service = socket.gets
  #   puts("IAMRAILS: Recvd data back! #{data_from_the_data_service}")
  # end
  
  def send_command(command)
    # send command every time a button is pushed
    socket = TCPSocket.open(SERVER_IP, SERVER_PORT)
    # if you uncomment private mehtod below, comment out line above and comment in this: socket = open_socket
    # puts("IAMRAILS: sending command #{command}")
    socket.puts(command)
    data_from_the_data_service = socket.gets
    JSON.parse(data_from_the_data_service, symbolize_names: true)
    # puts("IAMRAILS: Recvd data back! #{data_from_the_data_service}")
  end

  # private
  # def open_socket
  #   TCPSocket.open(SERVER_IP,SERVER_PORT)
  # end
end

# GreenhouseService.new.data_retrieval
# GreenhouseService.new.send_command("get_info")


# ---------------------------------------------------
# Original Code:

# i_am_rails = TCPSocket.open(SERVER_IP,SERVER_PORT)
# puts("IAMRAILS: sending command light_on")
# i_am_rails.puts("get_info")
# data_from_the_data_service = i_am_rails.gets
# puts("IAMRAILS: Recvd data back! #{data_from_the_data_service}")

# ---------------------------------------------------
# Notes: 

# "get_info" will return ONLY data from env. sensor sensor (an array of 5 hashes)
# light_on / light_off -> look up command patterns

# i_am_rails.puts("{light: true, fan: false, water_pump: false, soil_pump:false, hum_pump: false}")
# [{"id":"green1","temp":18.4474609375,"hum":51.748315839488534,"time_stamp":"2023/07/12 - 20:34:47"},{"id":"green1","temp":18.4423828125,"hum":51.75949714136712,"time_stamp":"2023/07/12 - 20:34:50"},{"id":"green1","temp":18.4474609375,"hum":51.73728871533302,"time_stamp":"2023/07/12 - 20:34:40"},{"id":"green1","temp":18.4474609375,"hum":51.8491017777968,"time_stamp":"2023/07/12 - 20:34:43"}]
# ---------------------------------------------------