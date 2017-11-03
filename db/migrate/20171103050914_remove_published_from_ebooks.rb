class RemovePublishedFromEbooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :ebooks, :published
  end
end
