module ApplicationHelper

	def show_link(link_text, link_source)
  		link_to("#{content_tag :i, nil, class: 'signup white icon'} #{link_text}".html_safe,
    	link_source, class: "ui big orange button")
	end
end
