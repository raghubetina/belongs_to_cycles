require "rails_helper"

RSpec.describe First, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:third) }

    it { should have_many(:seconds) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
