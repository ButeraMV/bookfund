class CreateOrderEbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :order_ebooks do |t|
      t.references :ebook, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.decimal :line_item_total
    end
  end
end
