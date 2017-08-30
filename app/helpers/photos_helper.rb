module PhotosHelper
  def render_tag_link(tag)
   path = if tag == "Untag"
            untag_photos_path
          elsif tag == "Family"
            family_photos_path
          elsif tag == "Animals"
            animals_photos_path
          elsif tag == "Children"
            children_photos_path
          end

    link_to("#{tag}", path, remote: true, class: "btn btn-default btn-lg", id: "#{tag.downcase}")
  end


end
