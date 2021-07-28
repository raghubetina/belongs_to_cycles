require 'rails_helper'

RSpec.describe "seconds#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/seconds/#{second.id}"
  end

  describe 'basic destroy' do
    let!(:second) { create(:second) }

    it 'updates the resource' do
      expect(SecondResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Second.count }.by(-1)
      expect { second.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
