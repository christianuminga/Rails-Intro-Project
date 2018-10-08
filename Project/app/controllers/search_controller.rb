class SearchController < ApplicationController
  def index
  end

  def results
    @requests = Request.where('service_area_id LIKE ?', "%#{params[:q]}%")

  end
end
