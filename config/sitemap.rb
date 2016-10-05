# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.tenpoundbackpack.com"

SitemapGenerator::Sitemap.sitemaps_host = "https://tpb-uploads.s3.amazonaws.com/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  add '/contact'
  add '/camping-articles'

  PostCategory.find_each do |post_category|
    add post_category_path(post_category)
  end

  Category.find_each do |category|
    add category_path(category) if category.gears.count > 10
  end

  Post.find_each do |post|
    add post_path(post), lastmod: post.updated_at
  end

  Page.find_each do |page|
    add page_path(page), lastmod: page.updated_at
  end

  Gear.find_each do |gear|
    add gear_path(gear), expires: Time.now - 1.week
  end
end
