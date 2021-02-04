require 'rails_helper'

RSpec.describe "/reseau_socials", type: :request do

  let(:valid_attributes) { build(:reseau_social).attributes }

  let(:invalid_attributes) { { nom_reseau: nil} }

  let(:valid_headers) {
    {
      "Content-Type": "application/json; charset=utf-8"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      ReseauSocial.create! valid_attributes
      get reseau_socials_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      reseau_social = ReseauSocial.create! valid_attributes
      get reseau_social_url(reseau_social), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ReseauSocial" do
        expect {
          post reseau_socials_url,
               params: { reseau_social: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ReseauSocial, :count).by(1)
      end

      it "renders a JSON response with the new reseau_social" do
        post reseau_socials_url,
             params: { reseau_social: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ReseauSocial" do
        expect {
          post reseau_socials_url,
               params: { reseau_social: invalid_attributes }, as: :json
        }.to change(ReseauSocial, :count).by(0)
      end

      it "renders a JSON response with errors for the new reseau_social" do
        post reseau_socials_url,
             params: { reseau_social: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { build(:reseau_social).attributes }

      it "updates the requested reseau_social" do
        reseau_social = ReseauSocial.create! valid_attributes
        patch reseau_social_url(reseau_social),
              params: { reseau_social: new_attributes }, headers: valid_headers, as: :json
        reseau_social.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the reseau_social" do
        reseau_social = ReseauSocial.create! valid_attributes
        patch reseau_social_url(reseau_social),
              params: { reseau_social: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the reseau_social" do
        reseau_social = ReseauSocial.create! valid_attributes
        patch reseau_social_url(reseau_social),
              params: { reseau_social: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested reseau_social" do
      reseau_social = ReseauSocial.create! valid_attributes
      expect {
        delete reseau_social_url(reseau_social), headers: valid_headers, as: :json
      }.to change(ReseauSocial, :count).by(-1)
    end
  end
end
