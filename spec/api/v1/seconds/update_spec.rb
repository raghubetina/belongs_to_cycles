require "rails_helper"

RSpec.describe "seconds#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/seconds/#{second.id}", payload
  end

  describe "basic update" do
    let!(:second) { create(:second) }

    let(:payload) do
      {
        data: {
          id: second.id.to_s,
          type: "seconds",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(SecondResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { second.reload.attributes }
    end
  end
end
