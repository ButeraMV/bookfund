class CreateEbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.text :description
      t.text :body
      t.boolean :published

      t.timestamps
    end
  end
end
