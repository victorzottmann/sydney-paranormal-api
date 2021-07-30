class Pin < ApplicationRecord

    belongs_to :user
    belongs_to :pin_family
    has_one :pin_family
end