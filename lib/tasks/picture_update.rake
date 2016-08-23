task :find_pictures => :environment do

	require 'nokogiri'
	require 'open-uri'

	Gear.order('last_picture_search desc').first(1000).each do |gear|

		data = Nokogiri::XML(open("http://classic.avantlink.com/api.php?affiliate_id=31645&module=ProductSearch&output=xml&website_id=41369&search_term=#{CGI.escape(gear.name)}&merchant_ids=10008%7C10060%7C10248%7C11957%7C13246%7C13582%7C10881&search_input_fields=name&search_results_sort_order=Match+Precision%7Cdesc&search_results_options=sortearly&search_results_count=1&search_results_options=precise"))

		if data.xpath('//Table1').present?
			if data.xpath('//Match_Precision').text.to_f > 50.0
				gear.update(large_image_url: data.xpath('//Large_Image').text,
										last_picture_search: Time.now)
			else
				gear.update(last_picture_search: Time.now)
			end
		else
			gear.update(last_picture_search: Time.now)
		end

	end
end
