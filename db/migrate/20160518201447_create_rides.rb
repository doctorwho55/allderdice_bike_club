class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.datetime :ride_start_time
      t.string :ride_name
      t.float :ride_distance
      t.time :ride_time
      t.float :ride_speed_average
      t.float :ride_speed_max
      t.string :rider_username
      t.float :ride_distance_climbed
      t.references :user, index: true

      t.timestamps
    end
  end
end
