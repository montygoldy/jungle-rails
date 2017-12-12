require 'rails_helper'

RSpec.feature "User add product to carts", type: :feature, js: true do
  # SETUP
  before :all do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        image: open_asset('apparel1.jpg'),
        price: 64.99
      )
    end
  end


  scenario 'user clicks add to cart button' do
    visit root_path

    first('article').find('footer').first('a').click

    # save_screenshot

    expect(page).to have_content('My Cart (1)')
  end
end
