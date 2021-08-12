class PinFamily < ApplicationRecord
  has_many :pins
  belongs_to :pin
end