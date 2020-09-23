class AddLinksToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :telegram, :string
    add_column :posts, :whatsapp, :string
    add_column :posts, :discord, :string
    add_column :posts, :slack, :string
    add_column :posts, :others, :string
  end
end
