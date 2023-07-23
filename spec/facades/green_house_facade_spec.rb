require 'rails_helper'

RSpec.describe GreenHouseFacade, type: :facade do
  describe "instance methods" do
    before(:each) do
      stub_tcp_socket = instance_double(TCPSocket)
      allow(TCPSocket).to receive(:open).with(SERVER_IP, SERVER_PORT).and_return(stub_tcp_socket)
      allow(stub_tcp_socket).to receive(:puts)
      allow(stub_tcp_socket).to receive(:gets).and_return(File.read("spec/fixtures/green1/enviro_data.json"))
    end
    
    let(:gh_facade) { GreenHouseFacade.new }

    describe "happy path tests" do
      describe "#initialize" do
        it "can create a green hosue service instance when initialized" do
          expect(gh_facade).to be_a(GreenHouseFacade)
          expect(gh_facade.gh_service).to be_a(GreenHouseService)
        end
      end

      describe "#fetch_current_enviro_data" do
        it "returns an openstruct object with current enviro data as attributes" do
          current_enviro_data = gh_facade.fetch_current_enviro_data

          expect(current_enviro_data).to be_a(OpenStruct)
          expect(current_enviro_data.temp).to be_a(Float)
          expect(current_enviro_data.hum).to be_a(Float)
          expect(current_enviro_data.time_stamp).to be_a(String)
          expect(current_enviro_data.id).to be_a(String)
        end
      end
    end
  end
end