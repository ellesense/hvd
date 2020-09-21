class DropSlugTable < ActiveRecord::Migration[6.0]
  def down
    drop_table :friendly_id_slugs
  end
end
