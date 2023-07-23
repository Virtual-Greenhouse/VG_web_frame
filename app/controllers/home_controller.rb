class HomeController < ApplicationController
  def index
    @current_evniro_data = GreenHouseFacade.new.fetch_current_enviro_data
  end
end