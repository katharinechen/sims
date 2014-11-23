class Item < ActiveRecord::Base 

  validates :name, presence: true 
  validates :PAR, presence: true, numericality: { only_integer: true }
  validates :current_stock_level, presence: true, numericality: { only_integer: true }
  
  def difference_between_par_and_inventory
    return self.PAR - self.current_stock_level
  end 

end 
