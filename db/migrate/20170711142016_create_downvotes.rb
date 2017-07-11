class CreateDownvotes < ActiveRecord::Migration[5.0]
  def change
    create_table :downvotes do |t|
      t.integer :vote_id

      t.timestamps
    end

    add_index :downvotes, :vote_id
  end
end
