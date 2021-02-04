require 'rails_helper'

RSpec.describe "/centre_interets", type: :request do
  let(:valid_attributes) { build(:centre_interet).attributes }

  let(:invalid_attributes) { { nom: nil } }
  
  let(:valid_headers) {
    {
      "Content-Type": "application/json; charset=utf-8"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      CentreInteret.create! valid_attributes
      get centre_interets_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      centre_interet = CentreInteret.create! valid_attributes
      get centre_interet_url(centre_interet), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new CentreInteret" do
        expect {
          post centre_interets_url,
               params: { centre_interet: valid_attributes }, headers: valid_headers, as: :json
        }.to change(CentreInteret, :count).by(1)
      end

      it "renders a JSON response with the new centre_interet" do
        post centre_interets_url,
             params: { centre_interet: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new CentreInteret" do
        expect {
          post centre_interets_url,
               params: { centre_interet: invalid_attributes }, as: :json
        }.to change(CentreInteret, :count).by(0)
      end

      it "renders a JSON response with errors for the new centre_interet" do
        post centre_interets_url,
             params: { centre_interet: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:centre_interet).attributes
      }

      it "updates the requested centre_interet" do
        centre_interet = CentreInteret.create! valid_attributes
        patch centre_interet_url(centre_interet),
              params: { centre_interet: new_attributes }, headers: valid_headers, as: :json
        centre_interet.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the centre_interet" do
        centre_interet = CentreInteret.create! valid_attributes
        patch centre_interet_url(centre_interet),
              params: { centre_interet: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the centre_interet" do
        centre_interet = CentreInteret.create! valid_attributes
        patch centre_interet_url(centre_interet),
              params: { centre_interet: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested centre_interet" do
      centre_interet = CentreInteret.create! valid_attributes
      expect {
        delete centre_interet_url(centre_interet), headers: valid_headers, as: :json
      }.to change(CentreInteret, :count).by(-1)
    end
  end
end
