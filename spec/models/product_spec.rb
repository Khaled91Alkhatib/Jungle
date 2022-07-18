require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save when all fields are present' do
      @category = Category.new(name: 'test-category')
      @product = Product.new(name: 'test-product', price_cents:123, quantity: 5, category: @category)
      expect(@category).to be_valid
      expect(@product).to be_valid
    end

    it 'should fail when there is no product name' do
      @category = Category.new(name: 'test-category')
      @product = Product.new(name: nil, price_cents:123, quantity: 5, category: @category)
      expect(@category).to be_valid
      expect(@product).to_not be_valid
    end

    it 'should fail when there is no product price' do
      @category = Category.new(name: 'test-category')
      @product = Product.new(name: 'test-product', price_cents: nil, quantity: 5, category: @category)
      expect(@category).to be_valid
      expect(@product).to_not be_valid
    end

    it 'should fail when there is no product quantity' do
      @category = Category.new(name: 'test-category')
      @product = Product.new(name: 'test-product', price_cents: 123, quantity: nil, category: @category)
      expect(@category).to be_valid
      expect(@product).to_not be_valid
    end

    it 'should fail when there is no product category' do
      @category = Category.new(name: 'test-category')
      @product = Product.new(name: 'test-product', price_cents: 123, quantity: 5, category: nil)
      expect(@category).to be_valid
      expect(@product).to_not be_valid
    end

  end
end