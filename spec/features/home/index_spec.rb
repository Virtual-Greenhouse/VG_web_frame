require 'rails_helper'

RSpec.describe "/", type: :feature do
  describe "happy path tests" do
    before(:each) do
      stub_tcp_socket = instance_double(TCPSocket)
      allow(TCPSocket).to receive(:open).with(SERVER_IP, SERVER_PORT).and_return(stub_tcp_socket)
      allow(stub_tcp_socket).to receive(:puts)
      allow(stub_tcp_socket).to receive(:gets).and_return(File.read("spec/fixtures/green1/enviro_data.json"))
      
      visit "/"
    end

    it "should display title" do
      expect(page).to have_content("Virtual Greenhouse Homepage")
      expect(page).to have_content("Current Environment Stats:")
      expect(page).to have_content("Date: 2023/07/21")
      expect(page).to have_content("Time: 12:31")
      expect(page).to have_content("Temperature (C): 19.65")
      expect(page).to have_content("Humidity: 58.69")
    end
  end
end