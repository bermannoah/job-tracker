require 'rails_helper'

RSpec.describe Tagging, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without both ids" do
        tagging = Tagging.new
        expect(tagging).to be_invalid
      end
      
      it "is invalid without tag_id" do
        tagging = Tagging.new(job_id: 1)
        expect(tagging).to be_invalid
      end

      it "is invalid without job id" do
        tagging = Tagging.new(tag_id: 1)
        expect(tagging).to be_invalid
      end

    end
    
    context "valid attributes" do
      it "is valid with ids" do
        tagging = Tagging.new(job_id: 1, tag_id: 1)
      end
    end
  end
    
  describe "relationships" do
    it "belongs to a job" do
      tagging = Tagging.new(job_id: 1, tag_id: 1)
      expect(tagging).to respond_to(:job_id)
    end
    
    it "belongs to a tag" do
      tagging = Tagging.new(job_id: 1, tag_id: 1)
      expect(tagging).to respond_to(:tag_id)
    end
  end
  
end
