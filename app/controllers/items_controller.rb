# Controller for Items
class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items_grid = initialize_grid(Item)
  end

  def new
    @item = Item.new
    render 'new'
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = 'You have successfully submitted the item information.'
      redirect_to root_url
    else
      flash[:alert] = 'You have failed to submit the item.'
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    render 'show'
  end

  def edit
    @item = Item.find(params[:id])
    render 'edit'
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(params[:item])
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def item_params
    params.require(:item).permit(:name, :PAR, :current_stock_level)
  end
end
