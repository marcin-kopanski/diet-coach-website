class AddIngredientsToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :ingredients, :text
  end
end
