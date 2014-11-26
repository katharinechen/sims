require 'rails_helper'

describe Inventory do
  before(:all) do
    @positive_args = [1, 10, 100, 1000, 10000, 100000]
    @negative_args = @positive_args.map { |value| value * -1 }
  end

  it { should belong_to(:item) }
  it { should validate_presence_of(:par) }
  it { should validate_numericality_of(:par) }
  it { should allow_value(*@positive_args).for(:par) }
  it { should_not allow_value(*@negative_args).for(:par) }
  it { should validate_presence_of(:on_hand) }
  it { should validate_numericality_of(:on_hand) }
  it { should allow_value(*@positive_args).for(:on_hand) }
  it { should_not allow_value(*@negative_args).for(:on_hand) }

  context 'FactoryGirl smoke test' do
    it 'creates an Inventory object w/FactoryGirl' do
      fg_inventory = FactoryGirl.build(:inventory)
      expect(fg_inventory.par).to eq 1000
      expect(fg_inventory.on_hand).to eq 1200
      expect(fg_inventory.item.nil?).to eq false
    end
    it 'uses FactoryGirl to save Inventory to the database' do
      FactoryGirl.create(:inventory)
      expect(Inventory.all.first.par).to eq 1000
      expect(Inventory.all.first.on_hand).to eq 1200
      expect(Inventory.all.first.item.nil?).to eq false
    end
  end

  describe '#understocked?' do
    it 'returns false when stock levels are over par' do
      expect(FactoryGirl.create(:inventory).understocked?).to eq false
    end
    it 'returns true when stock levels are under par' do
      item_inventory = FactoryGirl.create(:inventory, on_hand: 800)
      expect(item_inventory.understocked?).to eq true
    end
  end

  describe '#to_order' do
    it 'returns the correct negative number when stock exceeds par' do
      expect(FactoryGirl.create(:inventory).to_order).to eq(-200)
    end
    it 'returns the correct amount to order when stock is under par' do
      understocked_item = FactoryGirl.create(:inventory, on_hand: 800)
      expect(understocked_item.to_order).to eq 200
    end
  end
end
