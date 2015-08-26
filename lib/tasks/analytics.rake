# one time, add analytics tags to wp content

task :wp_analytics => :environment do

	Post.all.each do |post|
		['rei', 'campsaver', 'backcountry', 'ula-equipment', 'gossamergear.com'].each do |retailer|
			results = post.content.scan(/<a href=("http:\/\/w*.?#{retailer}.com[\w\/-]+")/)
			if results.present?
				unique_results = results.uniq
				unique_results.each do |result|
					post.content = post.content.gsub(result.first, "#{result.first} onclick=\"trackOutboundLink('#{result.first.gsub('"', '')}'); return false;\"")
				end
			end
		end
		post.save
	end

	Page.all.each do |post|
		['rei', 'campsaver', 'backcountry', 'ula-equipment', 'gossamergear.com'].each do |retailer|
			results = post.content.scan(/<a href=("http:\/\/w*.?#{retailer}.com[\w\/-]+")/)
			if results.present?
				unique_results = results.uniq
				unique_results.each do |result|
					post.content = post.content.gsub(result.first, "#{result.first} onclick=\"trackOutboundLink('#{result.first.gsub('"', '')}'); return false;\"")
				end
			end
		end
		post.save
	end
end

task :generate_params => :environment do

	include ActiveSupport::Inflector

	Post.all.each do |post|
		post.update(title_param: post.title.parameterize)
	end
end