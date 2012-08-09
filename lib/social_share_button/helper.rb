# coding: utf-8
module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      rel = opts[:rel]
      html = []
      url = opts[:url]
      html << "<div class='social-share-button' data-title='#{title}' data-img='#{opts[:image]}'>"
      
      SocialShareButton.config.allow_sites.each do |name,user|
        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")
        html << link_to("<i class=\"icon-#{name}\"></i>".html_safe, "#", :rel => "nofollow #{rel}", 
                        "data-site" => name, 
                        "data-user" => user,
                        "data-url" => url,
                        :onclick => "return SocialShareButton.share(this);",
                        :title => h(link_title))
      end
      html << opts[:opt_button]
      html << "</div>"
      raw html.join("\n")
    end
  end
end
