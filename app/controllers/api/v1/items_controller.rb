class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(params[:id])
  end

  def destroy
    @item = Item.find_by(params[:id])
    @item.destroy
    redirect_to items_path
  end
end
