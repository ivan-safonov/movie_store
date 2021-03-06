class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :rating
      t.string :subtitle
      t.text :comment

      t.timestamps
    end

    add_index :reviews, :user_id
    add_index :reviews, :movie_id
  end
end
