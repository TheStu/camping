json.array!(@pages) do |page|
  json.extract! page, :id, :content, :title, :thumbs_up, :thumbs_down, :large_image_url, :thumb_image_url, :meta_title, :meta_desc
  json.url page_url(page, format: :json)
end
