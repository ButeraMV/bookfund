class AddFundingToEbooks < ActiveRecord::Migration[5.1]
  def change
    add_column :ebooks, :funding, :money
  end
end
