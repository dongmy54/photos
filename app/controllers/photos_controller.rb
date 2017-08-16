class PhotosController < ApplicationController
  def index
    @photo = Photo.find(2)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    
    if @photo.save
      flash[:notice] = "#{@photo.title}图片成功创建"
      redirect_to photos_path
    else
      render :new
    end
  end


  private
    def photo_params
      params.require(:photo).permit( :image, :title, :tag)
    end
end
