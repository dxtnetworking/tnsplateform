require 'rails_helper'

RSpec.describe "/experiences", type: :request do

  let(:valid_attributes) {
    build(:experience).attributes
  }

  let(:invalid_attributes) {
    {
      titre_poste: nil,
      description: nil,
      type_poste: nil
    }
  }
  
  let(:valid_headers) {
    { "Content-Type": "application/json; charset=utf-8" }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Experience.create! valid_attributes
      get experiences_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      experience = Experience.create! valid_attributes
      get experience_url(experience), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Experience" do
        expect {
          post experiences_url,
               params: { experience: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Experience, :count).by(1)
      end

      it "renders a JSON response with the new experience" do
        post experiences_url,
             params: { experience: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Experience" do
        expect {
          post experiences_url,
               params: { experience: invalid_attributes }, as: :json
        }.to change(Experience, :count).by(0)
      end

      it "renders a JSON response with errors for the new experience" do
        post experiences_url,
             params: { experience: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:experience).attributes
      }

      it "updates the requested experience" do
        experience = Experience.create! valid_attributes
        patch experience_url(experience),
              params: { experience: new_attributes }, headers: valid_headers, as: :json
        experience.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the experience" do
        experience = Experience.create! valid_attributes
        patch experience_url(experience),
              params: { experience: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the experience" do
        experience = Experience.create! valid_attributes
        patch experience_url(experience),
              params: { experience: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested experience" do
      experience = Experience.create! valid_attributes
      expect {
        delete experience_url(experience), headers: valid_headers, as: :json
      }.to change(Experience, :count).by(-1)
    end
  end
end
