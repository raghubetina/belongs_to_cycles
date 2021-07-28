require 'rails_helper'

RSpec.describe "seconds#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/seconds", params: params
  end

  describe 'basic fetch' do
    let!(:second1) { create(:second) }
    let!(:second2) { create(:second) }

    it 'works' do
      expect(SecondResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['seconds'])
      expect(d.map(&:id)).to match_array([second1.id, second2.id])
    end
  end
end
