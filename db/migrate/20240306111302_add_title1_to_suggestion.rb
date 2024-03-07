class AddTitle1ToSuggestion < ActiveRecord::Migration[7.1]
  def change
    add_column :suggestions, :subtitle, :text
  end
end
