require 'rails_helper'

RSpec.describe GreenHouseService, type: :service do
  describe "instance methods" do
    let(:green_house_service) { GreenHouseService.new }
    
    context "#send_command - 'get_info'" do
      it "returns an array of hashes" do
        stub_tcp_socket = instance_double(TCPSocket)
        allow(TCPSocket).to receive(:open).with(SERVER_IP, SERVER_PORT).and_return(stub_tcp_socket)
        allow(stub_tcp_socket).to receive(:puts)
        allow(stub_tcp_socket).to receive(:gets).and_return(File.read("spec/fixtures/green1/enviro_data.json"))

        response = green_house_service.send_command("get_info")

        expect(response).to be_an(Array)
        expect(response[0]).to be_a(Hash)
        # chosing not to count how many hashes inside the array since it could vary
        expect(response[0].keys).to eq([:id, :temp, :hum, :time_stamp])
      end
    end
  end
end