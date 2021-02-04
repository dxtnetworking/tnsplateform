require 'rails_helper'


RSpec.describe "/villes", type: :request do

  let(:valid_attributes) {
    build(:ville).attributes
  }

  let(:invalid_attributes) {
    {
      nom: nil
    }
  }

  let(:valid_headers) {
    {
      "Content-Type": "application/json; charset=utf-8"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Ville.create! valid_attributes
      get villes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      ville = Ville.create! valid_attributes
      get ville_url(ville), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Ville" do
        expect {
          post villes_url,
               params: { ville: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Ville, :count).by(1)
      end

      it "renders a JSON response with the new ville" do
        post villes_url,
             params: { ville: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Ville" do
        expect {
          post villes_url,
               params: { ville: invalid_attributes }, as: :json
        }.to change(Ville, :count).by(0)
      end

      it "renders a JSON response with errors for the new ville" do
        post villes_url,
             params: { ville: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:ville).attributes
      }

      it "updates the requested ville" do
        ville = Ville.create! valid_attributes
        patch ville_url(ville),
              params: { ville: new_attributes }, headers: valid_headers, as: :json
        ville.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the ville" do
        ville = Ville.create! valid_attributes
        patch ville_url(ville),
              params: { ville: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the ville" do
        ville = Ville.create! valid_attributes
        patch ville_url(ville),
              params: { ville: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested ville" do
      ville = Ville.create! valid_attributes
      expect {
        delete ville_url(ville), headers: valid_headers, as: :json
      }.to change(Ville, :count).by(-1)
    end
  end
end
