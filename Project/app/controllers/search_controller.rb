class SearchController < ApplicationController
  def index
  end

  def results
    @requests = Request.where('name LIKE ?', "%#{params[:q]}%")

  end
end