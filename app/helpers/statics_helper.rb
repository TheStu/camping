module StaticsHelper

	## SEARCH ##

	def merch_name(result)
    name = result['Merchant_Name'].gsub('.com', '')
  end

  def pretty_name(result)
    if result['Brand_Name'].present?
      "#{result['Brand_Name'].titleize} #{result['Product_Name'].gsub("#{result['Brand_Name']} ", '').titleize}"
    else
      result['Product_Name'].titleize
    end
  end

end
