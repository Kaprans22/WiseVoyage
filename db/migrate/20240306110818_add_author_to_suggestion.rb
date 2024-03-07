class AddAuthorToSuggestion < ActiveRecord::Migration[7.1]
  def change
    add_column :suggestions, :author, :string
  end
end
