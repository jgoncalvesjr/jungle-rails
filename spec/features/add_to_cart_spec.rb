require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'
  
    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to the cart, and cart is added by one" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot("home_page_3.png")

    # VERIFY
    expect(page).to have_css 'article.product', count: 10
    expect(page).to have_text 'My Cart (0)'

    #ACT 
    within first('article.product') do
      click_button 'Add'
    end

    # DEBUG
    save_screenshot("new_cart.png")

    # VERIFY
    expect(page).to have_text 'My Cart (1)'

  end
end