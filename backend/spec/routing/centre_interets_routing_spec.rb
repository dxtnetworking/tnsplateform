require "rails_helper"

RSpec.describe CentreInteretsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/centre_interets").to route_to("centre_interets#index")
    end

    it "routes to #show" do
      expect(get: "/centre_interets/1").to route_to("centre_interets#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/centre_interets").to route_to("centre_interets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/centre_interets/1").to route_to("centre_interets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/centre_interets/1").to route_to("centre_interets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/centre_interets/1").to route_to("centre_interets#destroy", id: "1")
    end
  end
end
