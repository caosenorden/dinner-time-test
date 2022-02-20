# frozen_string_literal: true

class PopulateRecipes < ActiveRecord::Migration[6.1]
  def up
    Recipe.insert_all(
      JSON.parse(
        File.read(source_file_path)
      )
    )
  end

  def down
    Recipe.delete_all
  end

  def source_file_path
    Rails.root.join("resources", "recipes-english.json")
  end
end
