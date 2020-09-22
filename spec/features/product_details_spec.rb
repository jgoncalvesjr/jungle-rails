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

  scenario "They visit a product detail from the home page" do
    # ACT
    visit root_path

    # DEBUG
    save_screenshot("home_page_2.png")

    # VERIFY
    expect(page).to have_css 'article.product', count: 10

    #ACT 
    within first('article.product') do
      click_link 'Details »'
    end
    sleep 0.2

    # DEBUG
    save_screenshot("product_detail.png")

    # VERIFY
    expect(page).to have_css '.product-detail', count: 1

  end
end
