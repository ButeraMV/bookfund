class AddAuthorIdToEbooks < ActiveRecord::Migration[5.1]
  def change
    change_table(:ebooks) do |t|
      t.belongs_to :author
    end
  end
end
