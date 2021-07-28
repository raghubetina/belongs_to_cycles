require "rails_helper"

RSpec.describe "firsts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/firsts/#{first.id}"
  end

  describe "basic destroy" do
    let!(:first) { create(:first) }

    it "updates the resource" do
      expect(FirstResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { First.count }.by(-1)
      expect { first.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
