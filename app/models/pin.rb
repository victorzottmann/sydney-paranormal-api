class Pin < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :pin_family, optional: true
  has_one :pin_family
  accepts_nested_attributes_for :pin_family

  geocoded_by :address
  after_validation :geocode

  def address
    [street, suburb, state, country].compact.join(', ')
  end
end