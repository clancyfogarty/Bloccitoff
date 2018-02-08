class ItemsController < ApplicationController
  def index
    @items = current_user.items
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.new(items_param)

    if @item.save
      redirect_to authenticated_index_path, notice: "To do item saved"
    else
      flash[:alert] = "There was an error saving your to do item"
      render :new
    end
  end

  def items_param
    params.require(:item).permit(:body)
  end
end
