require "rails_helper"

RSpec.describe HabilitesExtraProsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/habilites_extra_pros").to route_to("habilites_extra_pros#index")
    end

    it "routes to #show" do
      expect(get: "/habilites_extra_pros/1").to route_to("habilites_extra_pros#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/habilites_extra_pros").to route_to("habilites_extra_pros#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/habilites_extra_pros/1").to route_to("habilites_extra_pros#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/habilites_extra_pros/1").to route_to("habilites_extra_pros#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/habilites_extra_pros/1").to route_to("habilites_extra_pros#destroy", id: "1")
    end
  end
end
