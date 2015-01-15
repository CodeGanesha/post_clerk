require "spec_helper"

RSpec.describe OfficeClerk::Post do


  describe 'using the default weight-price table: [1 2 5 10 20] => [2 5 10 15 18]' do
    context '.price_for(basket)' do
      it 'gives 15.0 when total price is 100 and weight is 10kg' do
        next
        @basket = create :basket_with_item
        create_package(weight: 10.0, price: 100.0)
        result = subject.compute(@basket)
        expect(result).to eq(15.0)
      end

      it 'gives 25.0 when total price is 40 and weight is 10kg' do
        next
        @basket = create :basket_with_item
        create_package(weight: 10.0, price: 40.0)
        result = subject.compute(@basket)
        expect(result).to eq(25.0)
      end

      it 'gives 6 when total price is 60 and weight is less than 1kg' do
        next
        @basket = create :basket_with_item
        create_package(weight: 0.5, price: 60.0)
        result = subject.compute(@basket)
        expect(result).to eq(6.0)
      end

      it 'gives 16 when total price is 40 and weight is less than 1kg' do
        next
        @basket = create :basket_with_item
        create_package(weight: 0.5, price: 40.0)
        result = subject.compute(@basket)
        expect(result).to eq(16.0)
      end

      it 'gives 30 when total price is 200 and weight is 25kg (split into two)' do
        @basket = basket_with({:weight =>  25.0} , {:price => 200.0} )
        result = compute_for(@basket , :max_price => 250)
        expect(result).to eq(30.0)
      end

      it 'gives 0 when total price is more than the MAX, for any number of items' do
        next
        @basket = create :basket_with_item
        create_package(weight: 25.0, price: 350.0)
        subject.preferred_max_price = 300
        result = subject.compute(@basket)
        expect(result).to eq(0.0)
      end
    end
  end

  describe 'when preferred max is 18 kg' do
    context '.available?(package)' do
      it 'is false when item weighs more than 18kg' do
        @basket = create :basket_with_item
#        create_package(weight: 20)
 #       expect(subject.available?(@basket)).to be(false)
      end
    end

  end
  def basket_with product , item
    @basket = create :basket_with_item
    @basket.items.first.product.update_attributes(product)
    @basket.items.first.update_attributes(item)
    @basket
  end
  def compute_for(basket , args)
    OfficeClerk::Post.new(args).price_for(basket)
  end
end
