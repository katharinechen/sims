# This will guess the Inventory class
FactoryGirl.define do
  factory :inventory do
    item
    par 1000
    on_hand 1200
  end
end
