require 'rails_helper'

feature "different tag link different picture", :type => :feature do

  before do
    %w[empty family animals children].each do |tag|
      Photo.create( :title => "test",
                    :tag => tag,
                    :image => File.new("public/uploads/test.jpg"))
    end
  end 

  scenario "home page should include all kind of tag" do
    visit "/"

    expect(page).to satisfy {|page| page.has_content?("empty") && 
                                    page.has_content?("family") &&
                                    page.has_content?("animals") &&
                                    page.has_content?("children") }
    # 用satisfy检查同时包含各种标签
  end

  scenario "click untag only show picture with empty tag" do
    visit "/"

    click_link "Untag"

    expect(page).to have_content("empty")
    expect(page).to have_no_content("family")
    expect(page).to have_no_content("animals")
    expect(page).to have_no_content("children")
  end

  scenario "click family only show picture with family tag" do
    visit "/"

    click_link "Family"

    expect(page).to have_content("family")
    expect(page).to have_no_content("empty")
    expect(page).to have_no_content("animals")
    expect(page).to have_no_content("children")
  end

  scenario "click animals only show picture with animals tag" do
    visit "/"

    click_link "Animals"

    expect(page).to have_content("animals")
    expect(page).to have_no_content("empty")
    expect(page).to have_no_content("family")
    expect(page).to have_no_content("children")
  end
  
  scenario "click children only show picture with children tag" do
    visit "/"

    click_link "Children"

    expect(page).to have_content("childre")
    expect(page).to have_no_content("empty")
    expect(page).to have_no_content("family")
    expect(page).to have_no_content("animals")
  end

end