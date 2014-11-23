class Item < ActiveRecord::Base 

  validates :name, presence: true 
  validates :PAR, presence: true, numericality: { only_integer: true }
  validates :current_stock_level, presence: true, numericality: { only_integer: true }
  
  def difference_between_par_and_inventory
    return self.PAR - self.current_stock_level
  end 

  # replace this with real cost_per_unit later  
  def cost_per_unit
    return rand(100)
  end 

  def estimated_cost_to_par
    return self.cost_per_unit * self.difference_between_par_and_inventory
  end 
end 
