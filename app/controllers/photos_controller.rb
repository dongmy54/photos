class PhotosController < ApplicationController
  
  def index
    @photos = Photo.all.paginate(:page => params[:page], :per_page => 6)
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

  def update
    @photo = Photo.find(params[:id])
    @tag = params[:tag]
    @success = tag_valid?(@tag, @photo) && @photo.update!(tag: @tag)
  end
  
  Tag.pluck(:name).each do |tag|       # 动态定义，empty/family/animals/children方法
    define_method(tag) {
      @photos = filter_photo(tag)
      @current_tag = tag
      render :index
    }
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

  private
    
    def photo_params
      params.require(:photo).permit(:image, :title, :tag)
    end

    def tag_valid?(tag,photo)
      tag_list.include?(tag) && (tag != photo.tag)
    end

    def filter_photo(tag)
      Photo.where(tag: tag).paginate(:page => params[:page], :per_page => 6)
    end

end
