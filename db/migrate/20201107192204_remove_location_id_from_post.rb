class RemoveLocationIdFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :location_id
  end
end
