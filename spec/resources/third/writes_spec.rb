require 'rails_helper'

RSpec.describe ThirdResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'thirds',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ThirdResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Third.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:third) { create(:third) }

    let(:payload) do
      {
        data: {
          id: third.id.to_s,
          type: 'thirds',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ThirdResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { third.reload.updated_at }
      # .and change { third.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:third) { create(:third) }

    let(:instance) do
      ThirdResource.find(id: third.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Third.count }.by(-1)
    end
  end
end
