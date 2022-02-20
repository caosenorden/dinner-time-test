class CreateRecipes < ActiveRecord::Migration[6.1]
  # ["title", "cook_time", "prep_time", "ingredients", "ratings", "cuisine", "category", "author", "image"]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :cook_time
      t.string :prep_time
      t.string :ingredients, array: true
      t.float  :ratings
      t.string :cuisine
      t.string :category
      t.string :author
      t.string :image
      t.string :timestamps
    end
  end
end
