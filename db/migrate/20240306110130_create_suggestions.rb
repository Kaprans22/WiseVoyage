class CreateSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :quote
      t.text :paragraph1
      t.text :paragrapph2
      t.text :paragraph3

      t.timestamps
    end
  end
end
