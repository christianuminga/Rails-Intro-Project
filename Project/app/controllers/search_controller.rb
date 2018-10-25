class SearchController < ApplicationController
  def index
  end

  def results
    if params[:category] == "" && params[:q] != nil

      @requests = Request.where('name LIKE ?', "%#{params[:q]}%").page(params[:page])

    elsif params[:category] != nil && params[:q] == ""

      @requests = Request.where('service_area_id LIKE ?', "%#{params[:category]}%").page(params[:page])

    elsif params[:category] != nil && params[:q] != nil

      @requests = Request.where('name LIKE ? AND service_area_id LIKE?', "%#{params[:q]}%", "%#{params[:category]}%").page(params[:page])

    end
  end
end
