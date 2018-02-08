class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
       flash[:notice] = "Item was saved."
       redirect_to current_user
     else
       flash[:error] = "There was an error saving the item. Please try again."
       render :new
     end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted."
      redirect_to current_user
    else
      flash[:error] = "There was an error deleteomgthe item. Please try again."
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
