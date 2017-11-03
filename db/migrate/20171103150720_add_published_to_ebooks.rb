class AddPublishedToEbooks < ActiveRecord::Migration[5.1]
  def change
    add_column :ebooks, :published, :boolean, default: false
  end
end
