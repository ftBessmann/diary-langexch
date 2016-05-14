require 'csv'

Country.delete_all
Language.delete_all

CSV.foreach("db/data/countries.csv", { col_sep: "#" }) do |row|
	# The second element in the row array is the country name
	Country.create(name: row[1])
end

CSV.foreach("db/data/languages.csv") do |row|
	# The second element in the row array is the language name
	Language.create(name: row[1])
end
