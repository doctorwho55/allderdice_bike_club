json.array!(@event_posts) do |event_post|
  json.extract! event_post, :id, :user_id, :title, :author, :event_name, :event_date_time, :event_description
  json.url event_post_url(event_post, format: :json)
end
