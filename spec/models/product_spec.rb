require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    # it {is_expected.to validate_presence_of(:name)}
    # it {is_expected.to validate_presence_of(:price)}
    # it {is_expected.to validate_presence_of(:quantity)}
    # it {is_expected.to validate_presence_of(:category)}

    it "should save properly" do
      @category = Category.new(name: "Computers")
      @product = Product.create(
        name: "Asus",
        price: 30,
        quantity: 1,
        category: @category
        )
      expect(@product.save).to be true
    end

    it "Name should not be blank" do
      @category = Category.new(name: "Computers")
      @product = Product.create(
        name: nil,
        price: 30,
        quantity: 1,
        category: @category
        )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "Price should not be blank" do
      @category = Category.new(name: "Computers")
      @product = Product.create(
        name: "Asus",
        price: nil,
        quantity: 1,
        category: @category
        )
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "Quantity should not be blank" do
      @category = Category.new(name: "Computers")
      @product = Product.create(
        name: "Asus",
        price: 30,
        quantity: nil,
        category: @category
        )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "Quantity should not be blank" do
      @category = Category.new(name: "Computers")
      @product = Product.create(
        name: "Asus",
        price: 30,
        quantity: 1,
        category: nil
        )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
