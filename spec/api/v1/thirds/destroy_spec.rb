require "rails_helper"

RSpec.describe "thirds#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/thirds/#{third.id}"
  end

  describe "basic destroy" do
    let!(:third) { create(:third) }

    it "updates the resource" do
      expect(ThirdResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Third.count }.by(-1)
      expect { third.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
