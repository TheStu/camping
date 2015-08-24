module ApplicationHelper

	def full_title(page_title) #Returns the full title on a per-page basis.
	  base_title = "Camping Smarts"
	  if page_title.empty?
	    base_title
	  elsif page_title == "home"
	    "#{base_title} | Find The Perfect Outdoor Gear"
	  else
	    "#{page_title} | #{base_title}"
	  end
	end

	def meta_desc(desc) #Returns the full title on a per-page basis.
	  if desc.empty?
	    "Backpacking and Hiking - Information, Reviews and Comparisons"
	  else
	    desc
	  end
	end

end
