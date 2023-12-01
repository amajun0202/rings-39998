class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string      :title,              null: false
      t.string      :estimated_time,     null: false
      t.integer     :meal_enter_id,      null: false
      t.integer     :max_cost,           null: false
      t.integer     :min_cost,           null: false
      t.text        :description,        null: false
      t.text        :address,            null: false, unique: true
      t.string      :phone_number
      t.string      :nearest_station
      t.integer     :travel_time
      t.string      :business_hours,     null: false
      t.string      :official_url
      t.integer     :requires_id,        null: false
      t.references  :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
