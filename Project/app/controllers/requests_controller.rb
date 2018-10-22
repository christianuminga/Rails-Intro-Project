class RequestsController < ApplicationController
  def index
    @requests = Request.order('date DESC').page(params[:page])
  end

  def show
    @request = Request.find(params[:id])
  end

  def all_requests
    @requests = Request.all.order('date DESC')
  end
end
