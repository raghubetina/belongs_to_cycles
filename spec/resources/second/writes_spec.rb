require "rails_helper"

RSpec.describe SecondResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "seconds",
          attributes: {},
        },
      }
    end

    let(:instance) do
      SecondResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Second.count }.by(1)
    end
  end

  describe "updating" do
    let!(:second) { create(:second) }

    let(:payload) do
      {
        data: {
          id: second.id.to_s,
          type: "seconds",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      SecondResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { second.reload.updated_at }
      # .and change { second.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:second) { create(:second) }

    let(:instance) do
      SecondResource.find(id: second.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Second.count }.by(-1)
    end
  end
end
