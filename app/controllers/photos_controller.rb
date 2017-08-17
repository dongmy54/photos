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
    if @photo.update(photo_params)
      tag = @photo.tag
      select_photo(tag)
      flash[:notice] = "恭喜您！#{@photo.title}标签属性编辑成功。"
    else
      render :js => "alert('亲，#{params[:photo][:tag]}是无效标签，标签只能为 empty/family/animals/children,请重新修改');"
    end
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
      params.require(:photo).permit( :image, :title, :tag)
    end

    def select_photo(tag)
      @photos = Photo.where(tag: tag).paginate(:page => params[:page], :per_page => 6)
      @tag = tag
      render :index
    end
end
