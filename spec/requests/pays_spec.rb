require 'rails_helper'


RSpec.describe "/pays", type: :request do

  let(:valid_attributes) {
    build(:pay).attributes
  }

  let(:invalid_attributes) {
    {
      nom: nil,
      code_iso: "asa"
    }
  }

  let(:valid_headers) {
    { "Content-Type": "application/json; charset=utf-8" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Pay.create! valid_attributes
      get pays_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pay = Pay.create! valid_attributes
      get pay_url(pay), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pay" do
        expect {
          post pays_url,
               params: { pay: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Pay, :count).by(1)
      end

      it "renders a JSON response with the new pay" do
        post pays_url,
             params: { pay: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pay" do
        expect {
          post pays_url,
               params: { pay: invalid_attributes }, as: :json
        }.to change(Pay, :count).by(0)
      end

      it "renders a JSON response with errors for the new pay" do
        post pays_url,
             params: { pay: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:pay).attributes
      }

      it "updates the requested pay" do
        pay = Pay.create! valid_attributes
        patch pay_url(pay),
              params: { pay: new_attributes }, headers: valid_headers, as: :json
        pay.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the pay" do
        pay = Pay.create! valid_attributes
        patch pay_url(pay),
              params: { pay: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the pay" do
        pay = Pay.create! valid_attributes
        patch pay_url(pay),
              params: { pay: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pay" do
      pay = Pay.create! valid_attributes
      expect {
        delete pay_url(pay), headers: valid_headers, as: :json
      }.to change(Pay, :count).by(-1)
    end
  end
end
