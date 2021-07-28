require "rails_helper"

RSpec.describe "thirds#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/thirds/#{third.id}", params: params
  end

  describe "basic fetch" do
    let!(:third) { create(:third) }

    it "works" do
      expect(ThirdResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("thirds")
      expect(d.id).to eq(third.id)
    end
  end
end
