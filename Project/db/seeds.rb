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

Ticket.destroy_all
Violation.destroy_all
Street.destroy_all

url = 'https://data.winnipeg.ca/resource/9w2n-uhf9.json?'
uri = URI(url)
response = Net::HTTP.get(uri)

parsed = JSON.parse(response)

parsed.each do |c|

    street = c['street']
    violation = c['violation']

    Street.create(street: street)
    Violation.create(violation: violation)

end

parsed.each do |b|
    street = Street.where(:street => b['street']).first
    violation = Violation.where(:violation => b['violation']).first

    Ticket.create(issue_date: b['issue_date'], ticket_number: b['ticket_number'],
                  street: street, violation: violation)

end

puts " - There are #{Street.count} streets."
puts " - There are #{Violation.count} violations."
puts " - There are #{Ticket.count} tickets."
