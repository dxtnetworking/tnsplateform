require 'rails_helper'

RSpec.describe "/clubs", type: :request do

  let(:valid_attributes) {
    build(:club).attributes
  }

  let(:invalid_attributes) { { nom: nil } }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ClubsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {
      "content-Type": "application/json; charset=utf-8"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Club.create! valid_attributes
      get clubs_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      club = Club.create! valid_attributes
      get club_url(club), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Club" do
        expect {
          post clubs_url,
               params: { club: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Club, :count).by(1)
      end

      it "renders a JSON response with the new club" do
        post clubs_url,
             params: { club: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Club" do
        expect {
          post clubs_url,
               params: { club: invalid_attributes }, as: :json
        }.to change(Club, :count).by(0)
      end

      it "renders a JSON response with errors for the new club" do
        post clubs_url,
             params: { club: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        build(:club).attributes
      }

      it "updates the requested club" do
        club = Club.create! valid_attributes
        patch club_url(club),
              params: { club: new_attributes }, headers: valid_headers, as: :json
        club.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the club" do
        club = Club.create! valid_attributes
        patch club_url(club),
              params: { club: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the club" do
        club = Club.create! valid_attributes
        patch club_url(club),
              params: { club: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested club" do
      club = Club.create! valid_attributes
      expect {
        delete club_url(club), headers: valid_headers, as: :json
      }.to change(Club, :count).by(-1)
    end
  end
end
