require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Creation" do
    before do
      @post = FactoryBot.create(:post)
    end

    it "can be created" do
      expect(@post).to be_valid
    end

    it 'is invalid with a nil date' do
      @post.date = nil
      expect(@post).to_not be_valid
    end

    it 'is invalid with a nil rationale' do
      @post.rationale = nil
      expect(@post).to_not be_valid
    end


    it 'is invalid with a nil overtime_request' do
      @post.overtime_request = nil
      expect(@post).to_not be_valid
    end
  end
end
