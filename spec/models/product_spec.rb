require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save a new product' do
      @category = Category.create(name: "Games")
      @product = Product.new(
        name: "Catan",
        price: 54.99,
        quantity: 12,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end

    it 'should return an error if name is nil' do
      @category = Category.create(name: "Games")
      @product = Product.new(
        name: nil,
        price: 54.99,
        quantity: 12,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'should return an error if price is nil' do
      @category = Category.create(name: "Games")
      @product = Product.new(
        name: "Catan",
        price: nil,
        quantity: 12,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'should return an error if quantity is nil' do
      @category = Category.create(name: "Games")
      @product = Product.new(
        name: "Catan",
        price: 54.99,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'should return an error if name is nil' do
      @category = Category.create(name: "Games")
      @product = Product.new(
        name: "Catan",
        price: 54.99,
        quantity: 12,
        category_id: nil
      )
      expect(@product).to_not be_valid
    end
  end
end
