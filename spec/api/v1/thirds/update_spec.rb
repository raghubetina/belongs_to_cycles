require 'rails_helper'

RSpec.describe "thirds#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/thirds/#{third.id}", payload
  end

  describe 'basic update' do
    let!(:third) { create(:third) }

    let(:payload) do
      {
        data: {
          id: third.id.to_s,
          type: 'thirds',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ThirdResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { third.reload.attributes }
    end
  end
end
