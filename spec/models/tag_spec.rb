require 'rails_helper'

RSpec.describe Tag, type: :model do
  
  describe 'validation tag' do

    it "is invalid without name" do
      tag = Tag.new

      expect(tag).to_not be_valid
    end
  
  end
end
