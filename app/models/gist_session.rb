class GistSession < ApplicationRecord
  validates :title, :description, :address, :start_time, :finish_time, :capacity, presence: true

  belongs_to :host, class_name: "User"
  has_many :guests, through: :bookings, foreign_key: :guest_id
  has_one_attached :photo
end
