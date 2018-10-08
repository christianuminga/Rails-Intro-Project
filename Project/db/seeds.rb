# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'pp'

Request.destroy_all
Neighbourhood.destroy_all
ServiceArea.destroy_all
ServiceRequest.destroy_all

url = 'https://data.winnipeg.ca/resource/9w2n-uhf9.json?'
uri = URI(url)
response = Net::HTTP.get(uri)

parsed = JSON.parse(response)

parsed.each do |c|

    neighbourhood = c['neighbourhood']
    service_area = c['service_area']
    service_request = c['service_request']
    
    Neighbourhood.create(name: neighbourhood)
    ServiceArea.create(name: service_area)
    ServiceRequest.create(name: service_request)

end

parsed.each do |b|
    name = b['service_request'] + " @ " + b['neighbourhood'] 
    neighbourhood = Neighbourhood.where(:name => b['neighbourhood']).first
    service_area = ServiceArea.where(:name => b['service_area']).first
    service_request = ServiceRequest.where(:name => b['service_request']).first

    Request.create(name: name, date: b['sr_date'], location: b['location_1']['coordinates'].to_s.tr('[]', ''),
                   neighbourhood: neighbourhood, service_area: service_area, service_request: service_request)

end

puts " - There are #{Neighbourhood.count} neighbourhoods."
puts " - There are #{ServiceArea.count} service areas."
puts " - There are #{ServiceRequest.count} service requests."
puts " - There are #{Request.count} requests."


