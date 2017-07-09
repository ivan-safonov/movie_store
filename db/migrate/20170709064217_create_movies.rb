class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :age_rating
      t.string :rating
      t.string :studio
      t.string :status
      t.string :price
      t.string :genre
      t.string :year
      t.date :released
      t.date :dvd_release_date

      t.timestamps
    end
  end
end
