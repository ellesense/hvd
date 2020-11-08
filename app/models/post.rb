class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category

    # Action Text - available from Rails 6
    has_rich_text :description

    validates :title, length: { minimum: 2, maximum: 40 }
    validates :description, length: { minimum: 10 }

    paginates_per 50
end
