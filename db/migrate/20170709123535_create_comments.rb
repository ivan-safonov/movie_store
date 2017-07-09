class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :review_id
      t.text :txt

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :review_id
  end
end