require 'rails_helper'

describe Item do 

  it { should validate_presence_of :name }
  it { should validate_presence_of :PAR }
  it { should validate_numericality_of :PAR }
  it { should validate_presence_of :current_stock_level }
  it { should validate_numericality_of :current_stock_level }

end 
