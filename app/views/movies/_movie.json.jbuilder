json.extract! movie, :id, :age_rating, :rating, :studio, :status, :price, :genre,
              :year, :released, :dvd_release_date, :name, :created_at, :updated_at
json.url movie_url(movie, format: :json)
