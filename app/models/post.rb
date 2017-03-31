class Post < ActiveRecord::Base
  
  include Bootsy::Container
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :post_category
  has_and_belongs_to_many :recommendations

  validates_presence_of :title, :content, :post_category, :large_image_url, :meta_title, :thumb_image_url, :meta_desc 

  def to_param
    "#{title.parameterize}"
  end

  def formatted_content
    text = self.content
    text = '' if text.nil?
    text = text.dup
    text.gsub!('<!--ads-->', '')
    text.gsub!('<!--more-->', '')
    text.gsub!('!rec', recommended_gear)
    text.gsub!('http://www.tenpoundbackpack.com/wp-content/uploads', '/assets')
    text.gsub!('http://www.tenpoundbackpack.com', '')
    text = text.to_str
    text.gsub!(/\r\n?/, "\n")                    # \r\n and \r -> \n
    text.gsub!(/\n\n+/, "</p>\n\n<p>")  # 2+ newline  -> paragraph
    text.insert 0, '<p>'
    text.html_safe.safe_concat("</p>")
	end

  def title_param
    title.parameterize
  end

  def self.most_popular
    Post.order(:view_count).first(5)
  end

  def recommended_gear
    a_one = []
    recommendations.each { |r| a_one << "<td><img alt='#{ r.title + ' ' + title }' src='#{ r.picture_url }' ></td>" }
    a_two = []
    recommendations.each { |r| a_two << "<td><b>#{ r.title }</b></td>" }
    a_three = []
    recommendations.each { |r| a_three << "<td>#{ r.feature_one }</td>" }
    a_four = []
    recommendations.each { |r| a_four << "<td>#{ r.feature_two }</td>" }
    a_five = []
    recommendations.each { |r| a_five << "<td>#{ r.feature_three }</td>" }
    a_six = []
    recommendations.each { |r| a_six << "<td><a class='btn btn-xs btn-primary' target='_blank' rel='nofollow' href=#{ r.url }>See Price and Reviews</a></td>" }
    open = "<table class='recommend-table'>"
    close = "</table>"
    one = "<tr>" + a_one.join + "</tr>"
    two = "<tr>" + a_two.join + "</tr>"
    three = "<tr>" + a_three.join + "</tr>"
    four = "<tr>" + a_four.join + "</tr>"
    five = "<tr>" + a_five.join + "</tr>"
    six = "<tr>" + a_six.join + "</tr>"
    return open + one + two + three + four + five + six + close
  end

end
