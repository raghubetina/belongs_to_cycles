require 'rails_helper'

RSpec.describe "firsts#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/firsts/#{first.id}", params: params
  end

  describe 'basic fetch' do
    let!(:first) { create(:first) }

    it 'works' do
      expect(FirstResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('firsts')
      expect(d.id).to eq(first.id)
    end
  end
end
