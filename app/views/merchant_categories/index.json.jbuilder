json.array!(@merchant_categories) do |merchant_category|
  json.extract! merchant_category, :id, :category_id, :merchant_id, :matching_product_group_id
  json.url merchant_category_url(merchant_category, format: :json)
end
