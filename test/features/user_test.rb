require "test_helper"

class UserTest < Capybara::Rails::TestCase

  describe "the user signs in", :type => :feature do

    before :each do
      visit '/users/sign_in'
      within("#new_user") do
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Sign In'
    end

    it 'edits post' do
      page.must_have_content "Watched Books"
    end

    it 'edits page' do
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
