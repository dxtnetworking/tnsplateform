require "rails_helper"

RSpec.describe ReseauSocialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/reseau_socials").to route_to("reseau_socials#index")
    end

    it "routes to #show" do
      expect(get: "/reseau_socials/1").to route_to("reseau_socials#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/reseau_socials").to route_to("reseau_socials#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/reseau_socials/1").to route_to("reseau_socials#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/reseau_socials/1").to route_to("reseau_socials#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/reseau_socials/1").to route_to("reseau_socials#destroy", id: "1")
    end
  end
end
