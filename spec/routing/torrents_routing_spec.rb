require "rails_helper"

RSpec.describe TorrentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/torrents").to route_to("torrents#index")
    end

    it "routes to #new" do
      expect(:get => "/torrents/new").to route_to("torrents#new")
    end

    it "routes to #show" do
      expect(:get => "/torrents/1").to route_to("torrents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/torrents/1/edit").to route_to("torrents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/torrents").to route_to("torrents#create")
    end

    it "routes to #update" do
      expect(:put => "/torrents/1").to route_to("torrents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/torrents/1").to route_to("torrents#destroy", :id => "1")
    end

  end
end
