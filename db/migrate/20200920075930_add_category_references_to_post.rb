class AddCategoryReferencesToPost < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :category, null: true, foreign_key: true
  end
end
