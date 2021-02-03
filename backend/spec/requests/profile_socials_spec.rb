require 'rails_helper'

RSpec.describe "/profile_socials", type: :request do
  let(:valid_attributes) { build(:profile_social).attributes }

  let(:invalid_attributes) { { lien_profile: nil } }

  let(:valid_headers) {
    {
      "Content-Type": "application/json; charset=utf-8"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      ProfileSocial.create! valid_attributes
      get profile_socials_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      profile_social = ProfileSocial.create! valid_attributes
      get profile_social_url(profile_social), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ProfileSocial" do
        expect {
          post profile_socials_url,
               params: { profile_social: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ProfileSocial, :count).by(1)
      end

      it "renders a JSON response with the new profile_social" do
        post profile_socials_url,
             params: { profile_social: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ProfileSocial" do
        expect {
          post profile_socials_url,
               params: { profile_social: invalid_attributes }, as: :json
        }.to change(ProfileSocial, :count).by(0)
      end

      it "renders a JSON response with errors for the new profile_social" do
        post profile_socials_url,
             params: { profile_social: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { build(:profile_social).attributes }

      it "updates the requested profile_social" do
        profile_social = ProfileSocial.create! valid_attributes
        patch profile_social_url(profile_social),
              params: { profile_social: new_attributes }, headers: valid_headers, as: :json
        profile_social.reload
        expect(response).to have_http_status(:ok)
      end

      it "renders a JSON response with the profile_social" do
        profile_social = ProfileSocial.create! valid_attributes
        patch profile_social_url(profile_social),
              params: { profile_social: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the profile_social" do
        profile_social = ProfileSocial.create! valid_attributes
        patch profile_social_url(profile_social),
              params: { profile_social: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested profile_social" do
      profile_social = ProfileSocial.create! valid_attributes
      expect {
        delete profile_social_url(profile_social), headers: valid_headers, as: :json
      }.to change(ProfileSocial, :count).by(-1)
    end
  end
end
