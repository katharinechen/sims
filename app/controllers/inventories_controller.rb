class InventoriesController < ApplicationController

  def index
    @inventory = Inventory.ordered_by_item_name
    @inventory_grid = initialize_grid(@inventory)
  end

  def new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end

end
