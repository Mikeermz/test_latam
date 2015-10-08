require "pp"
require "csv"

require_relative "Sale.rb"
require_relative "Finland.rb"
require_relative "India.rb"
require_relative "Ireland.rb"


CSV.foreach("SalesJan2009.csv", :headers => true) do |row|
	case row[7]

	when "Ireland"
		Ireland.new(row[1], row[2], row[0], row[10], row[11], row[5], row[3], row[4])

	when "India"
		India.new(row[1], row[2], row[0], row[10], row[11], row[5], row[3], row[4])

	when "Finland"
		Finland.new(row[1], row[2], row[0], row[10], row[11], row[5], row[3], row[4])
		
	else
		Sale.new(row[1], row[2], row[0], row[10], row[11], row[5], row[3], row[4])
	end
end

puts Sale.all.last.to_s
puts Sale.all.first.to_geo
puts Sale.mastercard
pp Sale.sin_repetecion("Ireland")
pp Sale.sin_repetecion("India")
pp Sale.sin_repetecion("Finland")
pp Sale.sin_repetecion("Otro")




=begin 

Transaction_date 0
Product 1
Price 2
Payment_Type 3
Name 4
City 5
State 6
Country 7
Account_Created 8
Last_Login 9 
Latitude 10 
Longitude 11

=end