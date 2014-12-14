require 'rails_helper'

describe Item do
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_least(3) }
  it { should ensure_length_of(:name).is_at_most(32) }
  it { should have_many(:inventories) }

  context 'FactoryGirl smoke test' do
    it 'creates an Item using FactoryGirl' do
      expect(FactoryGirl.build(:item).name).to eq 'plates'
    end
    it 'uses FactoryGirl to save an Item to the database' do
      FactoryGirl.create(:item)
      expect(Item.all.first.name).to eq 'plates'
    end
  end
end
