class StoresController < ApplicationController
  def index
    if params[:zip]
      @stores = Store.by_zip(params[:zip])
    else
      @stores = Store.all
    end 
  end
end
