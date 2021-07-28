require 'rails_helper'

RSpec.describe "firsts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/firsts", params: params
  end

  describe 'basic fetch' do
    let!(:first1) { create(:first) }
    let!(:first2) { create(:first) }

    it 'works' do
      expect(FirstResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['firsts'])
      expect(d.map(&:id)).to match_array([first1.id, first2.id])
    end
  end
end
