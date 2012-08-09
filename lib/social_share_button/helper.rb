# coding: utf-8
module SocialShareButton
  module Helper
    def social_share_button_tag(title = "", opts = {})
      rel = opts[:rel]
      html = []
      url = opts[:url]
      html << "<div class='social-share-button' data-url='#{url}' data-img='#{opts[:image]}'>"
      
      SocialShareButton.config.allow_sites.each do |name,configs|
        link_title = t "social_share_button.share_to", :name => t("social_share_button.#{name.downcase}")

        link_content = name == 'weibo' ? configs[:link_content] : "<i class=\"icon-#{name}\"></i>".html_safe
        html << link_to(link_content, "#", :rel => "nofollow #{rel}", 
                        "data-site" => name, 
                        "data-user" => configs[:user],
                        "data-title" => title.gsub(/data_user/, configs[:user]).gsub(/spot_name/, opts[:spot_name] || ''),
                        :onclick => "return SocialShareButton.share(this);",
                        :title => h(link_title))
      end
      html << "</div>"
      raw html.join("\n")
    end
  end
end
