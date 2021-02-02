require "rails_helper"

RSpec.describe VillesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/villes").to route_to("villes#index")
    end

    it "routes to #show" do
      expect(get: "/villes/1").to route_to("villes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/villes").to route_to("villes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/villes/1").to route_to("villes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/villes/1").to route_to("villes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/villes/1").to route_to("villes#destroy", id: "1")
    end
  end
end
