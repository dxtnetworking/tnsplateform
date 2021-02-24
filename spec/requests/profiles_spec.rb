require 'rails_helper'


RSpec.describe "/profiles", type: :request do  
  
  # let(:valid_attributes) { build(:profile).attributes }

  # let(:invalid_attributes) do 
  #   {
  #     niveau_etude: nil,
  #     occupation_actuelle: nil
  #   }
  # end


  # let(:valid_headers) {
  #   { "Content-Type" => "application/json; charset=utf-8"}
  # }

  # describe "GET /index" do
  #   it "renders a successful response" do
  #     Profile.create! valid_attributes
      
  #     get profiles_url, headers: valid_headers, as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /show" do
  #   it "renders a successful response" do
  #     profile = Profile.create! valid_attributes
  #     get profile_url(profile), as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new Profile" do
  #       expect {
  #         post profiles_url,
  #              params: { profile: valid_attributes }, 
  #              headers: valid_headers,
  #              as: :json
  #       }.to change(Profile, :count).by(1)
  #     end

  #     it "renders a JSON response with the new profile" do
  #       post profiles_url,
  #            params: { profile: valid_attributes }, 
  #            headers: valid_headers,
  #            as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new Profile" do
  #       expect {
  #         post profiles_url,
  #              params: { profile: invalid_attributes }, as: :json
  #       }.to change(Profile, :count).by(0)
  #     end

  #     it "renders a JSON response with errors for the new profile" do
  #       post profiles_url,
  #            params: { profile: invalid_attributes }, 
  #            headers: valid_headers, 
  #            as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json; charset=utf-8")
  #     end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) { build(:profile).attributes }

  #     it "updates the requested profile" do
  #       profile = Profile.create! valid_attributes
  #       patch profile_url(profile),
  #             params: { profile: new_attributes }, 
  #             headers: valid_headers,
  #             as: :json
  #       profile.reload
  #       expect(response).to have_http_status(:ok)        
  #     end

  #     it "renders a JSON response with the profile" do
  #       profile = Profile.create! valid_attributes
  #       patch profile_url(profile),
  #             params: { profile: new_attributes }, 
  #             headers: valid_headers, 
  #             as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the profile" do
  #       profile = Profile.create! valid_attributes
  #       patch profile_url(profile),
  #             params: { profile: invalid_attributes }, 
  #             headers: valid_headers,
  #             as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to eq("application/json; charset=utf-8")
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested profile" do
  #     profile = Profile.create! valid_attributes
  #     expect {
  #       delete profile_url(profile), 
  #       headers: valid_headers, 
  #       as: :json
  #     }.to change(Profile, :count).by(-1)
  #   end
  # end
end
