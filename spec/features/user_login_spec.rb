require 'rails_helper'

RSpec.feature "Logged in user can add items to cart", type: :feature, js: true do
  before :each do
    @user = User.create(
          first_name: "Carlisle",
          last_name: "Testerson",
          email: "test@gmail.com",
          password: "testMe1234",
          password_confirmation: "testMe1234"
        )
  end

  scenario "They can login then add items to the cart" do
    visit '/login'

    fill_in id:'email', with: "test@gmail.com"
    fill_in id: 'password', with: "testMe1234"

    click_button "Login"

    expect(page).to have_content('Logout')

    save_screenshot
  end
end
