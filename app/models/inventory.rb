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
  validates_presence_of :par
  validates_numericality_of :par, only_integer: true, greater_than: 0
  validates_presence_of :on_hand
  validates_numericality_of :on_hand,
    only_integer: true,
    greater_than_or_equal_to: 0

  def understocked?
    on_hand < par
  end

  def to_order
    par - on_hand
  end
end
