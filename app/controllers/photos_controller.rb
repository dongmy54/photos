class PhotosController < ApplicationController
  def index
    @photos = Photo.all.paginate(:page => params[:page], :per_page => 6)
    @tags = %w[Untag Family Animals Children]
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

  def empty
    select_photo("empty")
  end

  def family
    select_photo("family")
  end

  def animals
    select_photo("animals")
  end

  def children
    select_photo("children")
  end


  private
    def photo_params
      params.require(:photo).permit(:image, :title, :tag)
    end

    def select_photo(tag)
      @photos = Photo.where(tag: tag).paginate(:page => params[:page], :per_page => 6)
      @tag = tag
      @tags = %w[Untag Family Animals Children]
      render :index
    end

    def tag_valid?(tag,photo)
      valid_tag = %w[empty family animals children]
      valid_tag.include?(tag) && (tag != photo.tag)
    end

end
