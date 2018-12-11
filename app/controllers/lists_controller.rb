class ListsController < ApplicationController

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  
  
  def show
    @list = List.find(params[:id])
    @listtags = ListTag.where(list_id: @list)
    @items = Item.where(list_id: @list)

  end

  private

  def list_params
    params.require(:list).permit(:list_type, :name, :photo, :description)
  end

end
