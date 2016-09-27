#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Ten Pound Backpack"
    xml.author "Stuart Morris"
    xml.description "Helping You Find The Perfect Camping Gear"
    xml.link "http://www.tenpoundbackpack.com"
    xml.language "en"

    for post in @posts
      xml.item do
        if post.title
          xml.title post.title
        else
          xml.title ""
        end
        xml.author "Stuart Morris"
        xml.pubDate post.published_at.to_s(:rfc822)
        xml.link "http://www.tenpoundbackpack.com/posts/" + post.slug
        xml.guid post.id
        xml.description post.meta_desc
      end
    end
  end
end
