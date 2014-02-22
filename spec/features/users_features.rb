require 'spec_helper'

def create_user
  click_link 'New User'
  fill_in 'user_name', with: 'user1'
  fill_in 'user_email', with: 'user1@stacktoheap.com'
  click_button 'Create User'
  click_link 'Back'
end

describe "Users resource", :type => :feature, :js => true do
  it "create new user" do
    visit '/users'

    create_user

    expect(page).to have_content 'user1'
    expect(page).to have_content 'user1@stacktoheap.com'
  end

  it "delete user" do
    visit '/users'

    create_user

    click_link 'Destroy'
    page.driver.browser.switch_to.alert.accept

    expect(page).to_not have_content 'user1'
  end
end