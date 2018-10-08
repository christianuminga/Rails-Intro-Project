class RequestsController < ApplicationController
  def index
    @requests = Request.all.order('date DESC')
  end

  def show
    @request = Request.find(params[:id])
  end
end
