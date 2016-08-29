class Category < ActiveRecord::Base

	has_many :gears
	has_many :merchant_categories

	def to_param
		"#{name.parameterize}"
	end
end
