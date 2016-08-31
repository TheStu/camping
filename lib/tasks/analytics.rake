# one time, add analytics tags to wp content

task :wp_analytics => :environment do

	Post.all.each do |post|
		['rei', 'campsaver', 'backcountry', 'ula-equipment', 'gossamergear.com'].each do |retailer|
			results = post.content.scan(/<a (href="http:\/\/w*.?#{retailer}.com[\w\/-]+")/)
			if results.present?
				unique_results = results.uniq
				unique_results.each do |result|
					post.content = post.content.gsub(result.first, "onclick=\"trackOutboundLink('#{result.first.gsub('"', '').gsub('href=', '')}'); return false;\" #{result.first}")
				end
			end
		end
		post.save
	end

	Page.all.each do |post|
		['rei', 'campsaver', 'backcountry', 'ula-equipment', 'gossamergear.com'].each do |retailer|
			results = post.content.scan(/<a (href="http:\/\/w*.?#{retailer}.com[\w\/-]+")/)
			if results.present?
				unique_results = results.uniq
				unique_results.each do |result|
					post.content = post.content.gsub(result.first, "onclick=\"trackOutboundLink('#{result.first.gsub('"', '').gsub('href=', '')}'); return false;\" #{result.first}")
				end
			end
		end
		post.save
	end
end

task :hardcode_links => :environment do
	# one time use -- finds merchant links and hardcodes them to AV links, because adblockers :(

	Page.all.each do |page|
		['rei', 'campsaver', 'backcountry', 'ula-equipment', 'gossamergear'].each do |retailer|
			results = page.content.scan(/<a href="(http:\/\/w*.?#{retailer}.com[\w\/-]+)"/)
			if results.present?
				unique_results = results.flatten.uniq
				unique_results.each do |result|
					replace_with = "http://www.avantlink.com/click.php?tt=ale&ti=3481&pri=0&pw=41369&mi=10060&url=" + CGI.escape(result)
					page.content = page.content.gsub(result, replace_with)
				end
			end
		end
		page.save
	end

	Post.all.each do |page|
		['rei', 'campsaver', 'backcountry', 'ula-equipment', 'gossamergear'].each do |retailer|
			results = page.content.scan(/<a href="(http:\/\/w*.?#{retailer}.com[\w\/-]+)"/)
			if results.present?
				unique_results = results.flatten.uniq
				unique_results.each do |result|
					replace_with = "http://www.avantlink.com/click.php?tt=ale&ti=3481&pri=0&pw=41369&mi=10060&url=" + CGI.escape(result)
					page.content = page.content.gsub(result, replace_with)
				end
			end
		end
		page.save
	end

	#http://www.backcountry.com/western-mountaineering-highlite-sleeping-bag-35-degree-down
	#http://www.avantlink.com/click.php?tt=ale&ti=3481&pri=0&pw=41369&mi=10060&url=http%3A%2F%2Fwww.backcountry.com%2Fwestern-mountaineering-highlite-sleeping-bag-35-degree-down
	# <a href=\"http://www.rei.com/product/808962/marmot-plasma-30-sleeping-bag\"><img class=\"alignright size-full wp-image-1211\" title=\"Down Sleeping Bags\" src=\"http://www.tenpoundbackpack.com/wp-content/uploads/2011/10/Down-Sleeping-Bags.jpg\" alt=\"Down Sleeping Bags\" width=\"142\" height=\"400\" /></a>To find even more of the best down sleeping bags, head to the <a href=\"http://www.tenpoundbackpack.com/gear-lists/sleeping-bags/\">compare sleeping bags list</a>.\n<h2>Down Sleeping Bags</h2>\nWhen shopping for sleeping bags you have one big decision to make, which is whether to go with a synthetic sleeping bag or a down sleeping bag.\n\nA synthetic sleeping bag offers a lot of benefits. The main benefit is that the synthetic material in a synthetic sleeping does not lose too much of its insulating capabilities when wet. Down, on the other hand, isn't much good for insulation when wet, so the last thing you want to do is get a down sleeping bag wet.\n\nBut as long as you can keep your down sleeping bag dry, there are a few really great benefits to using a down sleeping bag.\n<h3>Benefits of Down Sleeping Bags</h3>\n<ul>\n\t<li><strong>Weight of Down Sleeping Bags</strong> - The chief benefit of down sleeping bags is that they weigh a lot less, on average, than synthetic sleeping bags. If you are looking for a <a href=\"http://www.tenpoundbackpack.com/lightweight-sleeping-bags/\">lightweight sleeping bag</a>, then this is a huge benefit.</li>\n\t<li><strong>Size</strong> - Since down sleeping bags are typically able to achieve the same temperature rating with less insulation, they also tend to pack down smaller, which is great for a crowded backpack.</li>\n\t<li><strong>Shifting Insulation</strong> - Another great benefit of down sleeping bags is that you can actually shift the down around in a lot of them, unlike in synthetic sleeping bags. So on cold nights, you are able to shift some of the down from the bottom of the bag, where it doesn't do any good, to the top and sides, where it will help to keep you warm.</li>\n</ul>\nHere are a few of the best down sleeping bags that you will find on the market right now.\n<h3>Best Down Sleeping Bags for Summer</h3>\n<ul>\n\t<li><a href=\"http://www.campsaver.com/adrenaline-3-season-bag-800-down\" rel=\"nofollow\">GoLite Adrenaline 3-Season</a> - Winner of the <strong>Backpacker Magazine Editor's Choice Award in 2008 and the Backpacker Magazine Editor's Choice Green Award in 2010</strong>, this is a down sleeping bag with some serious credentials. It's made with 800+ fill goose down, is good down to 20 degrees, and weighs in at a very respectable <strong>985 grams</strong>, or 35 ounces.</li>\n\t<li><a href=\"http://www.backcountry.com/western-mountaineering-highlite-sleeping-bag-35-degree-down\" rel=\"nofollow\">Western Mountaineering HighLite</a> - This is another really great down sleeping bag. It weighs a very slim <strong>455 grams</strong>, or 16 ounces, and is good down to 35 degrees. It gets to that low low weight by using 850+ fill goose down. It also has a large, square baffling system that helps to keep the down where you want it.</li>\n\t<li><a href=\"http://www.rei.com/product/808962/marmot-plasma-30-sleeping-bag\" rel=\"nofollow\">Marmot Plasma +30</a> - Winner of the<strong> Backpacker Magazine Editor's Choice Award in 2011</strong>, this is another excellent down sleeping bag for the summer months. It is good down to 30 degrees, as the name implies, but the really stand out feature of this down sleeping bag is the use of 900 fill goose down, which helps get the weight down to <strong>644 grams</strong>, or 23 ounces.</li>\n</ul>\n<h3>Best Down Sleeping Bags for Winter</h3>\n<ul>\n\t<li><a href=\"http://www.campsaver.com/u-l-super-spiral-down-exp-800-down\" rel=\"nofollow\">Mont Bell U.L Super Spiral Down EXP</a> - Mont Bell is very well known for their down garments, but they do an equally good job with their down sleeping bags. This particular model is made with 800+ fill goose down, and weighs in at <strong>1559 grams</strong>, or 55 ounces, and a -20 temperature rating. What is great about Mont Bell sleeping bags, however, is the unique baffle design, which spirals around you, and helps to increase the warmth of the down sleeping bag.</li>\n\t<li><a href=\"http://www.backcountry.com/western-mountaineering-bison-gore-ws-sleeping-bag-40-degree-down\" rel=\"nofollow\">Western Mountaineering Bison Gore WS</a> - There is nothing quite like a down sleeping bag on a cold winter night, and the Bison Gore does not disappoint in this regard. Plenty of 850+ fill goose down helps it achieve a very impressive -40 temperature rating, and at only <strong>2095 grams</strong>, or 74 ounces, it is on the light side for that temperature rating. The best feature of this down sleeping bag, however, is the <strong>Gore Stopper outer shell</strong>, which is water resistant, to keep the down inside from getting wet.</li>\n\t<li><a href=\"http://www.rei.com/product/808964/marmot-plasma-15-sleeping-bag\" rel=\"nofollow\">Marmot Plasma +15</a> - The warmer version of the Plasma 30+ from the above list, this down sleeping bag won the same <strong>Backpacker Magazine Editor's Choice Award in 2011</strong>, along with <strong>Outside Magazine's Gear of the Year Award, also in 2011</strong>. It's definitely a well recognized down sleeping bag. Besides the awards, it is made with 900+ fill down, is good down to 15 degrees as the name implies, and all for just <strong>864 grams</strong>, or 30 ounces.</li>\n</ul>\n<div>Didn't find the down sleeping bag that you were looking for? You can see a whole lot more of them over at the <a href=\"http://www.tenpoundbackpack.com/gear-lists/sleeping-bags/\">compare sleeping bags list</a>.</div>"
end

task :generate_params => :environment do

	include ActiveSupport::Inflector

	Post.all.each do |post|
		post.update(title_param: post.title.parameterize)
	end
end