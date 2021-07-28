require 'rails_helper'

RSpec.describe Third, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:second) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
