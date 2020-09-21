require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before :all do
      @category = Category.new(
        name: 'Vehicles'
      )
    end

    before :each do
      @product = Product.new(
        name: 'Cyber old gen polygon electric car',
        price_cents: 34999999,
        quantity: 5,
        category: @category
      )
    end

    it 'should save with valid information' do
      @product.save
      expect(@product).to be_valid
      expect(@product.id).to be_present
    end

    it 'should not save if price is blank, and display validation error' do 
      @product.price_cents = nil
      @product.save
      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages[0]).to eq("Price cents is not a number")
    end

    it 'should not save if name is blank, and display validation error' do 
      @product.name = nil
      @product.save
      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages[0]).to eq("Name can't be blank")
    end

    it 'should not save if quantity is blank, and display validation error' do 
      @product.quantity = nil
      @product.save
      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages[0]).to eq("Quantity can't be blank")
    end

    it 'should not save if category is blank, and display validation error' do 
      @product.category = nil
      @product.save
      expect(@product.id).to_not be_present
      expect(@product.errors.full_messages[0]).to eq("Category can't be blank")
    end

  end
end
