require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        tag = Tag.new
        expect(tag).to be_invalid
      end
    end
    
    context "valid attributes" do
      it "is valid with a name" do
        tag = Tag.new(name: "test")
        expect(tag).to be_valid
      end
    end
  end
  
  describe "relationships" do
    it "belongs to a job" do
      tag = Tag.create(name: "test")
      expect(tag).to respond_to(:jobs)
    end
    
    it "belongs to a tagging" do
      tag = Tag.create(name: "test")
      expect(tag).to respond_to(:taggings)
    end
  end
  
  
end
