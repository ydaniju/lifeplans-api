# frozen_string_literal: true

require "rails_helper"
RSpec.describe "Update bucketlist process", type: :request do
  let(:user) do
    create(:user)
  end

  it "changes the attribute of a bucketlist" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    put "/bucketlists/#{bucketlist.id}", params: {
      name: "Visit China"
    }, headers: headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status 200
  end

  it "alerts when nothing is changed" do
    signin_helper(user.username, user.password)
    token = token_builder(user.username, user.password)

    bucketlist = create(:bucketlist)
    headers = {
      "ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_ACCEPT" => "application/vnd.lifeplans-api.v1+json",
      "HTTP_AUTHORIZATION" => "token #{token}"
    }

    put "/bucketlists/#{bucketlist.id}", params: {
      name: nil
    }, headers: headers

    expect(response.content_type).to eq("application/json")
    expect(response).to have_http_status :unprocessable_entity
  end
end
