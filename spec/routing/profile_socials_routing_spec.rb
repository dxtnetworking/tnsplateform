require "rails_helper"

RSpec.describe ProfileSocialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/profile_socials").to route_to("profile_socials#index")
    end

    it "routes to #show" do
      expect(get: "/profile_socials/1").to route_to("profile_socials#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/profile_socials").to route_to("profile_socials#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/profile_socials/1").to route_to("profile_socials#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/profile_socials/1").to route_to("profile_socials#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/profile_socials/1").to route_to("profile_socials#destroy", id: "1")
    end
  end
end
