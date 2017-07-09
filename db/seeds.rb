# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# IF YOU NEED LOAD MOVIES FORM CVS:

require 'csv'
require 'date'

Dir.chdir("#{Rails.root}/lib/assets/")
csv_file = "recent_movies.csv"
CSV.foreach(csv_file, headers: true) do |row|
  movie_params = { name: row[0],
                   studio: row[1],
                   released: row[2].blank? ? nil : (DateTime.strptime(row[2], "%m/%d/%Y") + 2000.years).strftime("%Y/%m/%d"),
                   status: row[3],
                   price: row[6],
                   age_rating: row[7],
                   year: row[8],
                   genre: row[9],
                   dvd_release_date: (DateTime.strptime(row[12], "%m/%d/%Y") + 2000.years).strftime("%Y/%m/%d"), }
  Movie.create movie_params
end