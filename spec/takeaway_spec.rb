require 'takeaway'

describe Takeaway do

subject(:takeaway) { described_class.new }

describe '#order' do

    it 'checks that the item is on the menu' do
      expect{takeaway.order("Non-menu item")}.to(raise_error("Not a menu item!"))
    end

    it 'adds an item to the order' do
      takeaway.order("nasty noodles")
      expect(takeaway.basket).to(have_key("nasty noodles"))
    end

    it 'assigns a default quantity of 1 if not specified' do
      takeaway.order("nasty noodles")
      expect(takeaway.basket).to(have_value(1))
    end

    it 'adds the order quantity to the basket' do
      takeaway.order("nasty noodles", 2)
      expect(takeaway.basket).to(have_value(2))
    end

    it 'calculates the total bill' do
    takeaway.order("nasty noodles",3)
    takeaway.order("rancid rice",3)
    expect(takeaway.total).to eq 38.70
    end

  end

end
