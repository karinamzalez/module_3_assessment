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
    render json: {
      error: "no content",
      status: 204
    }, status: 204
  end
end
