module PhotosHelper
  
  def render_tag_link(tag)
    path = "#{tag}_photos".to_sym 

    link_to("#{tag.capitalize}", path, remote: true,
                                       class: "btn btn-default btn-lg",
                                       id: "#{tag.downcase}")
  end

  def replace_title?
    params[:action] != "index"                     # 如果不是来自index的就需要替换title
  end

  def jq_drop_ids
    tag_list.map { |t| t.prepend("#") }.join(",")  # 生成接受图片释放区域的id
  end

  def delete_photo_trash(photo)
    link_to photo_path(photo),method: :delete, remote: true,
                              data: {confirm: "您确定删除此图吗？"} do
      content_tag(:i, "",:class => ["fa" ,"fa-trash-o", "trash"]) 
    end                                            # 将删除图片图标收纳
  end

end
