class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :imdb_id
      t.string :title
      t.text :plot
      t.string :poster
      t.string :release_date

      t.timestamps
    end
  end
end
