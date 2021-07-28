require 'rails_helper'

RSpec.describe FirstResource, type: :resource do
  describe 'serialization' do
    let!(:first) { create(:first) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(first.id)
      expect(data.jsonapi_type).to eq('firsts')
    end
  end

  describe 'filtering' do
    let!(:first1) { create(:first) }
    let!(:first2) { create(:first) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: first2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([first2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:first1) { create(:first) }
      let!(:first2) { create(:first) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            first1.id,
            first2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            first2.id,
            first1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
