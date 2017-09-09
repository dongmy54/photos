require 'rails_helper'

feature 'upload picture', :typer => :feature do

  before do
    Tag.create(:name => "children")
  end
  
  scenario "upload picture" do
    visit '/' 

    expect(page).to have_link("Upload Photo")
    
    click_link("Upload Photo")            # 点击上传图片链接

    within("#new_photo") do               # 填photo 表单
      fill_in "Title", with: "test"       # 注意这里title要大写，和label中保持一致
      fill_in "Tag"  , with: "children"   # tag 同理，需要大写
    end

    attach_file("Image", "spec/fixtures/test.jpg")  
                                          # 这里第一个参数为上传label标签

    click_button "Submit"        

    expect(page).to have_content("test图片成功创建")
  end

end