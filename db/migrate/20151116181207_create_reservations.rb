class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :email
      t.datetime :time
      t.text :message
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
