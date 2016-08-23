module ApplicationHelper

	def full_title(page_title) #Returns the full title on a per-page basis.
	  base_title = "Ten Pound Backpack"
	  if page_title.empty?
	    base_title
	  elsif page_title == "home"
	    "#{base_title} | Find The Perfect Camping Gear"
	  else
	    "#{page_title} | #{base_title}"
	  end
	end

	def meta_desc(desc) #Returns the full title on a per-page basis.
	  if desc.empty?
	    "Backpacking, Camping and Hiking - Information, Reviews and Comparisons"
	  else
	    desc
	  end
	end

	def index_scrub(html) #sanitizer for search results snippets
    Sanitize.clean(html, :elements => ['a', 'br', 'b', 'i', 'u', 'p', 'strong', 'em', 'strike'],
                         :attributes => { 'a' => ['target', 'rel', 'href']},
                         :protocols => {'a' => {'href' => ['http', 'https', 'mailto']}})
  end

  def old_content_scrub(html) #sanitizer for old posts and pages... same as above but removes images
    Sanitize.clean(html, :elements => ['a', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'ol', 'ul', 'li', 'br', 'b', 'i', 'a', 'u', 'p', 'strong', 'em', 'blockquote', 'strike'],
                         :attributes => { 'a' => ['target', 'rel', 'href']},
                         :protocols => {'a' => {'href' => ['http', 'https', 'mailto']}})
  end
end
