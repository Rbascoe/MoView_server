class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :number

      t.timestamps
    end
  end
end
