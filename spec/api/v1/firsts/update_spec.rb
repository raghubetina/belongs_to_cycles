require "rails_helper"

RSpec.describe "firsts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/firsts/#{first.id}", payload
  end

  describe "basic update" do
    let!(:first) { create(:first) }

    let(:payload) do
      {
        data: {
          id: first.id.to_s,
          type: "firsts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FirstResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { first.reload.attributes }
    end
  end
end
