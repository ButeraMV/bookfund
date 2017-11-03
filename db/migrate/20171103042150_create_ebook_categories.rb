class CreateEbookCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :ebook_categories do |t|
      t.references :ebook, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
