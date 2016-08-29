require "test_helper"

class VisitorTest < Capybara::Rails::TestCase

  describe "the visitor visits pages", :type => :feature do

    it 'visits home' do
      visit '/'
      page.must_have_content "Watched Books"
    end

    it 'visits home page 2' do
      visit '/'
      page.must_have_content "Watched Books"
    end

    it 'visits gear list' do
      visit '/gear-lists/sleeping-bags'
      page.must_have_content "Watched Books"
    end

    it 'visits blog post' do
      visit '/post/title-one'
      # must not have edit btn
      page.must_have_content "Watched Books"
    end

    it 'visits post category show' do
      visit '/post-category/sleeping-bags'
      page.must_have_content "Watched Books"
    end

    it 'visits page' do
      visit '/title-one'
      # must not have edit btn
      page.must_have_content "Watched Books"
    end

    it 'visits gear search' do
      visit '/'
      page.must_have_content "Watched Books"
    end
  end
end
