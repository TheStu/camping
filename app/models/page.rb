class Page < ActiveRecord::Base

  #validates_presence_of :content, :title, :large_image_url, :thumb_image_url, :meta_title, :meta_desc

	def to_param
    "#{title.parameterize}"
  end

  def user
    User.find_by_email('stuwashere@gmail.com')
  end

  def formatted_content
    text = self.content
    text = '' if text.nil?
    text = text.dup
    text.gsub!('<!--ads-->', '')
    text.gsub!('<!--more-->', '')
    text.gsub!('http://www.tenpoundbackpack.com/wp-content/uploads', '/assets')
    text.gsub!('http://www.tenpoundbackpack.com', '')
    text = text.to_str
    text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
    text.gsub!(/\n\n+/, "</p>\n\n<p>")  # 2+ newline  -> paragraph
    text.insert 0, '<p>'
    text.html_safe.safe_concat("</p>")
	end

end
