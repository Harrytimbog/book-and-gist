class GistSession < ApplicationRecord
  belongs_to :host, class_name: "User"
  has_many :guests, through: :bookings, foreign_key: :guest_id
end
