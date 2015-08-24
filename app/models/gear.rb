class Gear < ActiveRecord::Base

	belongs_to :category

	def to_param
   	"#{id}-#{name.parameterize}"
  end

end
