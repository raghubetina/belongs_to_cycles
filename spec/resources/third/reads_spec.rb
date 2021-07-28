require "rails_helper"

RSpec.describe ThirdResource, type: :resource do
  describe "serialization" do
    let!(:third) { create(:third) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(third.id)
      expect(data.jsonapi_type).to eq("thirds")
    end
  end

  describe "filtering" do
    let!(:third1) { create(:third) }
    let!(:third2) { create(:third) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: third2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([third2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:third1) { create(:third) }
      let!(:third2) { create(:third) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      third1.id,
                                      third2.id,
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
                                      third2.id,
                                      third1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
