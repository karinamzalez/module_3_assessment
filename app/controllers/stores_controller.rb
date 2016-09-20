class StoresController < ApplicationController
  def index
    if params[:zip]
      @stores = Stores.by_zip(params[:zip])
    else
      @stores = Store.all
    end
  end
end
