require "test_helper"

class UserTest < Capybara::Rails::TestCase

  describe "the user signs in", :type => :feature do

    before :each do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
    end

    it 'edits post' do
      Post.find_each(&:save) # friendly_id
      visit 'posts/title-one'
      click_link "Edit"
      fill_in "Title", with: 'title one two'
      click_button "Update Post"
      page.must_have_content "title one two"
    end

    it 'edits page successfully' do
      visit '/1'
      page.click_link "Edit"
      fill_in "Title", with: 'title one two'
      click_button "Update Page"
      page.must_have_content "title one two"
    end

    it 'edits page unsuccessfully' do
      page.must_have_content "Watched Books"
    end

    it 'creates new post' do
      page.must_have_content "Watched Books"
    end

    it 'visits /admin' do
      page.must_have_content "Watched Books"
    end

    it 'should land on user#show' do
      page.must_have_content "Watched Books"
    end
  end
end
