require "rails_helper"

RSpec.describe "seconds#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/seconds/#{second.id}", params: params
  end

  describe "basic fetch" do
    let!(:second) { create(:second) }

    it "works" do
      expect(SecondResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("seconds")
      expect(d.id).to eq(second.id)
    end
  end
end
