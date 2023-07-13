require "socket"
require_relative "secrets"

i_am_rails = TCPSocket.open(SERVER_IP,SERVER_PORT)
puts("IAMRAILS: sending command light_on")
i_am_rails.puts("get_info")
data_from_the_data_service = i_am_rails.gets
puts("IAMRAILS: Recvd data back! #{data_from_the_data_service}")

# "get_info" will return ONLY data from env. sensor sensor (an array of 5 hashes)
# light_on / light_off -> look up command patterns

# i_am_rails.puts("{light: true, fan: false, water_pump: false, soil_pump:false, hum_pump: false}")
# [{"id":"green1","temp":18.4474609375,"hum":51.748315839488534,"time_stamp":"2023/07/12 - 20:34:47"},{"id":"green1","temp":18.4423828125,"hum":51.75949714136712,"time_stamp":"2023/07/12 - 20:34:50"},{"id":"green1","temp":18.4474609375,"hum":51.73728871533302,"time_stamp":"2023/07/12 - 20:34:40"},{"id":"green1","temp":18.4474609375,"hum":51.8491017777968,"time_stamp":"2023/07/12 - 20:34:43"}]