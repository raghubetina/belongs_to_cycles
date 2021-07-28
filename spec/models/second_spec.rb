require 'rails_helper'

RSpec.describe Second, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:thirds) }

    it { should belong_to(:first) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
