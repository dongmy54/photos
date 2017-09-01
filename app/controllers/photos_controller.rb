class PhotosController < ApplicationController
  def index
    @photos = Photo.all.paginate(:page => params[:page], :per_page => 6)
    @tags = %w[Untag Family Animals Children]
    @come_from_index = true
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
    @finish = tag_valid?(@tag, @photo) && @photo.update!(tag: @tag)
  end
  
  %w[empty family animals children].each do |tag|       # 动态定义，empty/family/animals/children方法
    define_method(tag) {
      @photos = Photo.where(tag: tag).paginate(:page => params[:page], :per_page => 6)
      @tag = tag
      @tags = %w[Untag Family Animals Children]
      @come_from_index = false
      render :index
    }
  end

  private
    def photo_params
      params.require(:photo).permit(:image, :title, :tag)
    end

    def tag_valid?(tag,photo)
      valid_tag = %w[empty family animals children]
      valid_tag.include?(tag) && (tag != photo.tag)
    end

end
