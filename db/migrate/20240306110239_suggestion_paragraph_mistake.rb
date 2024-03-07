class SuggestionParagraphMistake < ActiveRecord::Migration[7.1]
  def change
    rename_column :suggestions, :paragrapph2, :paragraph2
  end
end
