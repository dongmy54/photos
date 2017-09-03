require 'rails_helper'

RSpec.describe Photo, :type => :model do
  
  describe "validation photo" do

    it "is invalid without title" do
      photo = Photo.new( :tag => "empty",
                         :image => File.new("public/uploads/test.jpg") )
      expect(photo).to_not be_valid
    end

    it "is invalid tag not in empty/family/children/animals" do
      photo = Photo.new( :title => "test",
                         :tag => "hu",
                         :image => File.new("public/uploads/test.jpg") )
      expect(photo).to_not be_valid
    end

    it "is invalid without image" do
      photo = Photo.new( :title => "test",
                         :tag => "empty" )
      expect(photo).to_not be_valid
    end

  end
end