require "rails_helper"

RSpec.describe "thirds#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/thirds", params: params
  end

  describe "basic fetch" do
    let!(:third1) { create(:third) }
    let!(:third2) { create(:third) }

    it "works" do
      expect(ThirdResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["thirds"])
      expect(d.map(&:id)).to match_array([third1.id, third2.id])
    end
  end
end
