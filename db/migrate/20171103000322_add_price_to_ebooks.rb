class AddPriceToEbooks < ActiveRecord::Migration[5.1]
  def change
    add_column :ebooks, :price, :float
  end
end
