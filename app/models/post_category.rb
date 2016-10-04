class PostCategory < ActiveRecord::Base
	
	has_many :posts
	has_many :recommendations

	extend FriendlyId
	friendly_id :name, use: :slugged
end
