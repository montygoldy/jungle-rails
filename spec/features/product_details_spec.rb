require 'rails_helper'

RSpec.feature "User navigates to ProductDetails", type: :feature, js: true do

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


  scenario "When they click the first product" do
   # ACT
    visit root_path

    page.first("article").find("header").first("a").click


     expect(page).to have_css('article.product-detail')

  end

end
