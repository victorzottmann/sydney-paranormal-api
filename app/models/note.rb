class Note < ApplicationRecord

    has_many :comments
    belongs_to :user
    belongs_to :pin
end