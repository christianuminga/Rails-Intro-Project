class Request < ApplicationRecord
  paginates_per 20

  belongs_to :neighbourhood
  belongs_to :service_area
  belongs_to :service_request
end
