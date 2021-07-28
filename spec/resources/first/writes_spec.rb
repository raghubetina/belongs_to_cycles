require 'rails_helper'

RSpec.describe FirstResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'firsts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FirstResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { First.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:first) { create(:first) }

    let(:payload) do
      {
        data: {
          id: first.id.to_s,
          type: 'firsts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FirstResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { first.reload.updated_at }
      # .and change { first.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:first) { create(:first) }

    let(:instance) do
      FirstResource.find(id: first.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { First.count }.by(-1)
    end
  end
end
