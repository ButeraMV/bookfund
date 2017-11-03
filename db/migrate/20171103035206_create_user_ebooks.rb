class CreateUserEbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_ebooks do |t|
      t.references :user, foreign_key: true
      t.references :ebook, foreign_key: true
    end
  end
end
