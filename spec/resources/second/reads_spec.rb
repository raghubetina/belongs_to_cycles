require "rails_helper"

RSpec.describe SecondResource, type: :resource do
  describe "serialization" do
    let!(:second) { create(:second) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(second.id)
      expect(data.jsonapi_type).to eq("seconds")
    end
  end

  describe "filtering" do
    let!(:second1) { create(:second) }
    let!(:second2) { create(:second) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: second2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([second2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:second1) { create(:second) }
      let!(:second2) { create(:second) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      second1.id,
                                      second2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      second2.id,
                                      second1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
