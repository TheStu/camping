class Recommendation < ActiveRecord::Base

	has_and_belongs_to_many :posts
	belongs_to :post_category

	validates_presence_of :title
	validates_presence_of :url
	validates_presence_of :picture_url
	validates_presence_of :post_category_id
	validates_presence_of :feature_one
	validates_presence_of :feature_two
	validates_presence_of :feature_three
	validates :retailer, inclusion: { in: ['CampSaver', 'REI', 'Backcountry'], message: "%{value} is not a valid status" }

	def self.retailers
		['CampSaver', 'REI', 'Backcountry']
	end
end
