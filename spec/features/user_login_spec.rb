require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  #SETUP
  before :all do
    @user = User.create!(
      first_name: 'Leeroy',
      last_name: 'Jenkins',
      email: 'power@overwhelming.com',
      password: 'mimimi',
      password_confirmation: 'mimimi'
    )
  end

  scenario "They log in with correct credentials and are redirected to the main page" do
    # ACT
    visit '/login'

    # DEBUG
    save_screenshot("login_page.png")

    # VERIFY
    expect(page.find('H1')).to have_text 'Login'

    # ACT 
    fill_in 'Email', with: 'power@overwhelming.com'
    fill_in 'password', with: 'mimimi'
    click_button 'Submit'

    # DEBUG
    save_screenshot("logged_in.png")

    # VERIFY
    expect(page.find('nav')).to have_text 'Welcome, Leeroy!'
    expect(page.find('nav')).to have_text 'Logout'

  end

  scenario "They do not log in with correct credentials and an error message is shown" do
    # ACT
    visit '/login'

    # DEBUG
    save_screenshot("login_page_2.png")

    # VERIFY
    expect(page.find('H1')).to have_text 'Login'

    # ACT 
    fill_in 'Email', with: 'power@overwhelming.com'
    fill_in 'password', with: 'supersecretpassowordihavenocluewhatitis'
    click_button 'Submit'

    # DEBUG
    save_screenshot("logged_error.png")

    # VERIFY
    expect(page.find('H1')).to have_text 'Login'
    expect(page.find('nav')).to have_text 'Login'
    expect(page.find('.alert')).to have_text 'Could not log in:'
    expect(page.find('.alert')).to have_text 'Incorrect Email or password, please try again!'

  end

end
