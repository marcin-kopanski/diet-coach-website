module ApplicationHelper

  def image_generator(width:,height:)
    "https://placehold.it/#{width}x#{height}"
  end

  def meta_tags
    
  end

  def meta_helper
    meta_list = ""

    if html_tag_class
      html_tag_class = " class='#{html_tag_class}'"
    end

    nav_items.each do |item|
      meta_list << "<meta name=\"#{item[:name]}\" content=\"#{item[:content]}\""
    end

    meta_list.html_safe
  end

  def nav_items
    [
      {
        url: root_path,
        title: "Główna"
      },
      {
        url: o_mnie_path,
        title: "O mnie"
      },
      {
        url: cennik_path,
        title: "Cennik"
      },
      {
        url: oferta_path,
        title: "Oferta"
      },
      {
        url: recipes_path,
        title: "Przepisy"
      },
      #{
      #  url: blogs_path,
      #  title: "Blog"
      #},
      {
        url: kontakt_path,
        title: "Kontakt"
      }
    ]
  end

  def nav_helper css_class, html_tag, html_tag_class = ""
    nav_links = ""

    if html_tag_class
      html_tag_class = " class='#{html_tag_class}'"
    end

    nav_items.each do |item|
      nav_links << "<#{html_tag}#{html_tag_class}><a href=\"#{item[:url]}\" class=\"#{css_class} #{active? item[:url]}\">#{item[:title]}</a></#{html_tag}>"
    end

    nav_links.html_safe
  end

  def login_helper css_class, html_tag, html_tag_class = ""
    login_links = ""

    if html_tag_class
      html_tag_class = " class='#{html_tag_class}'"
    end

    if !current_user.is_a?(GuestUser)
    #   login_links << "<#{html_tag}#{html_tag_class}><a href=\"#{new_user_registration_path}\" class=\"#{css_class} #{active? new_user_registration_path}\">Register</a></#{html_tag}>"
    #   login_links << "<#{html_tag}#{html_tag_class}><a href=\"#{new_user_session_path}\" class=\"#{css_class} #{active? new_user_session_path}\">Login</a></#{html_tag}>"
    # else
      login_links << "<#{html_tag}#{html_tag_class}><a href=\"#{destroy_user_session_path}\" class=\"#{css_class} #{active? destroy_user_session_path}\" data-method=\"delete\">Logout</a></#{html_tag}>"
    end

    login_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
  end

  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_html_blocks: true
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe unless text.nil?
  end
end
