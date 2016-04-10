module ApplicationHelper
  def nav_link(link_text, link_path, http_method=nil)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      if http_method
        link_to(link_text, link_path, method: http_method)
      else
        link_to(link_text, link_path)
      end
    end
  end

  def glyph_icon(icon_name, link_path,  html_options={})
    link_to "<span title=\"#{icon_name.capitalize}\" class=\"glyphicon glyphicon-#{icon_name}\">".html_safe, link_path, html_options
  end

  def remove_icon(link_path, html_options={})
    return glyph_icon(:remove, link_path, html_options)
  end

  def edit_icon(link_path, html_options={})
    return glyph_icon(:edit, link_path, html_options)
  end
end
