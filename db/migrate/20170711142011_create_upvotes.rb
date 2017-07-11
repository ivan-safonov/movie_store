class CreateUpvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :upvotes do |t|
      t.integer :vote_id

      t.timestamps
    end

    add_index :upvotes, :vote_id
  end
end
