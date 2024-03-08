class AddCategoryToSuggestions < ActiveRecord::Migration[7.1]
  def change
    add_column :suggestions, :region, :string
  end
end
