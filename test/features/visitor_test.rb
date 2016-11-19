require "test_helper"

class VisitorTest < Capybara::Rails::TestCase

  describe "the visitor visits pages", :type => :feature do

    it 'visits home' do
      visit root_path
      page.must_have_content "Lightweight Backpacking Posts"
      page.must_have_link "title one"
    end

    it 'visits gear list' do
      visit '/gear-lists/sleeping-bags'
      page.must_have_content "name one"
    end

    it 'visits blog post' do
      Post.find_each(&:save) # for friendly_id
      visit root_path
      first('a', text: 'title one').click
      page.wont_have_link "Edit"
      page.must_have_content "title one"
      page.must_have_content "content one"
    end

    it 'visits post category show' do
      PostCategory.find_each(&:save) # for friendly_id
      visit '/post-category/sleeping-bags'
      page.must_have_content "'Sleeping Bags' Post Category"
      page.must_have_link "title one"
    end

    it 'visits page' do
      visit page_path(Page.find_by_title('title one'))
      page.wont_have_link "Edit"
      page.must_have_content "title one"
      page.must_have_content "content one"
    end

    it 'visits page index' do
      visit root_path
      click_link 'Articles'
      page.must_have_content "Backpacking and Camping Articles"
    end

    it 'visits gear search' do
      visit '/search'
      page.must_have_content "Oops, looks there aren't any results for that search term. Don't give up now though! Try searching for something else..."
      page.must_have_button "Search"
    end
  end
end
