class Item < ActiveRecord::Base 

  validates :name, presence: true 
  validates :PAR, presence: true, numericality: { only_integer: true }
  validates :current_stock_level, presence: true, numericality: { only_integer: true }
  
end 
