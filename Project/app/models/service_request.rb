class ServiceRequest < ApplicationRecord
    has_many :request

    validates :name, presence: :true
    validates :name, uniqueness: true
end
