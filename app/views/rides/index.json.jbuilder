json.array!(@rides) do |ride|
  json.extract! ride, :id, :ride_start_time, :ride_name, :ride_distance, :ride_time, :ride_speed_average, :ride_speed_max, :rider_username, :ride_distance_climbed, :user_id
  json.url ride_url(ride, format: :json)
end
