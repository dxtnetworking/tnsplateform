require 'rails_helper'

RSpec.describe "/habilites_extra_pros", type: :request do

  let(:valid_attributes) { build(:habilites_extra_pro).attributes }

  let(:invalid_attributes) { { nom: nil } }
  
  let(:valid_headers) { { "Content-Type": "application/json; charset=utf-8" } }

  describe "GET /index" do
    it "renders a successful response" do
      HabilitesExtraPro.create! valid_attributes
      get habilites_extra_pros_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      habilites_extra_pro = HabilitesExtraPro.create! valid_attributes
      get habilites_extra_pro_url(habilites_extra_pro), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new HabilitesExtraPro" do
        expect {
          post habilites_extra_pros_url,
               params: { habilites_extra_pro: valid_attributes }, headers: valid_headers, as: :json
        }.to change(HabilitesExtraPro, :count).by(1)
      end

      it "renders a JSON response with the new habilites_extra_pro" do
        post habilites_extra_pros_url,
             params: { habilites_extra_pro: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new HabilitesExtraPro" do
        expect {
          post habilites_extra_pros_url,
               params: { habilites_extra_pro: invalid_attributes }, as: :json
        }.to change(HabilitesExtraPro, :count).by(0)
      end

      it "renders a JSON response with errors for the new habilites_extra_pro" do
        post habilites_extra_pros_url,
             params: { habilites_extra_pro: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { build(:habilites_extra_pro).attributes }

      it "updates the requested habilites_extra_pro" do
        habilites_extra_pro = HabilitesExtraPro.create! valid_attributes
        patch habilites_extra_pro_url(habilites_extra_pro),
              params: { habilites_extra_pro: new_attributes }, headers: valid_headers, as: :json
        habilites_extra_pro.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the habilites_extra_pro" do
        habilites_extra_pro = HabilitesExtraPro.create! valid_attributes
        patch habilites_extra_pro_url(habilites_extra_pro),
              params: { habilites_extra_pro: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the habilites_extra_pro" do
        habilites_extra_pro = HabilitesExtraPro.create! valid_attributes
        patch habilites_extra_pro_url(habilites_extra_pro),
              params: { habilites_extra_pro: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested habilites_extra_pro" do
      habilites_extra_pro = HabilitesExtraPro.create! valid_attributes
      expect {
        delete habilites_extra_pro_url(habilites_extra_pro), headers: valid_headers, as: :json
      }.to change(HabilitesExtraPro, :count).by(-1)
    end
  end
end
