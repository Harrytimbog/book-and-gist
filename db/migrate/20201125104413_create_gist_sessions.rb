class CreateGistSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :gist_sessions do |t|
      t.string :gist
      t.string :title
      t.text :description
      t.string :address
      t.datetime :start_time
      t.datetime :finish_time
      t.integer :capacity
      t.references :host, foreign_key: { to_table: 'users'}

      t.timestamps
    end
  end
end
