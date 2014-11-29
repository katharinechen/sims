# Inventory class
# Contains information on the stock levels for a given item
# maintains par (minimum on-hand stock) and
# on-hand (current) stock levels for said Item
###############
# At some point, this will likely have a belongs_to relationship
# with a physical location
################
class Inventory < ActiveRecord::Base
  belongs_to :item
  validates :par, presence: true
  validates :on_hand, presence: true
  validates :par,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :on_hand,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :ordered_by_item_name, -> { joins(:item).order('items.name') }

  def understocked?
    on_hand < par
  end

  def to_order
    par - on_hand
  end
end
