json.array!(@posts) do |post|
  json.extract! post, :id, :content, :title, :thumbs_up, :thumbs_down, :large_image_url, :thumb_image_url, :meta_title, :meta_desc, :category
  json.url post_url(post, format: :json)
end
