class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.references :guest, foreign_key: { to_table: 'users' }
      t.references :gist_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
