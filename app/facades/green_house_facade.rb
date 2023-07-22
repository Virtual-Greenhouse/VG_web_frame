require 'ostruct'

class GreenHouseFacade
  attr_reader :gh_service

  def initialize
    @gh_service = GreenHouseService.new
  end

  def fetch_current_enviro_data
    current_data_array = gh_service.send_command("get_info")
    # currently this returns an array of 4 hashes, we are selecting only one here:
    OpenStruct.new(current_data_array[0])
  end
end