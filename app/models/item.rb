class Item < ActiveRecord::Base 
  validates :name, presence: true 
  validates :par, presence: true, numericality: { only_integer: true }
  validates :current_stock_level, presence: true, numericality: { only_integer: true }

  attr_reader :par, :current_stock_level
  
  def difference_between_par_and_inventory
    par - current_stock_level
  end 

  # replace this with real cost_per_unit later  
  def cost_per_unit
    rand(100)
  end 

  def estimated_cost_to_par
    cost_per_unit * difference_between_par_and_inventory
  end 
end 
