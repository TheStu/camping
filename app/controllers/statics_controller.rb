class StaticsController < ApplicationController

	def search
		@query = (params[:q].present? ? params[:q] : '')
    @results = search_results(@query, @sale_only)
	end

  def home
    @posts = Post.order('published_at DESC').paginate(:page => params[:page], :per_page => 10)
  end

  def about
  end

  def contact
  end

  private 

  def search_results(query, sale)
    require 'open-uri'
    require 'nokogiri'

    url = "http://classic.avantlink.com/api.php?affiliate_id=31645&module=ProductSearch&output=xml&website_id=127225&search_term=#{CGI.escape(query)}&search_results_fields=Merchant+Name%7CSubcategory+Name%7CCategory+Name%7CDepartment+Name%7CProduct+Name%7CBrand+Name%7CRetail+Price%7CSale+Price%7CAbbreviated+Description%7CThumbnail+Image%7CBuy+URL%7CProduct+SKU%7CMerchant+Id&search_results_count=100&search_results_options=precise&merchant_ids=13582%7C10060%7C10008%7C10921%7C10248%7C11419%7C10068%7C10785%7C10049%7C13246%7C10881%7C11957"
    results = Nokogiri::XML(open(url))
    my_hash = results.search('//Table1').map{ |e| Hash.from_xml(e.to_xml)['Table1'] }
  end
end
