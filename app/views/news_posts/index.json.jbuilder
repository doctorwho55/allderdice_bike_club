json.array!(@news_posts) do |news_post|
  json.extract! news_post, :id, :user_id, :title, :author, :body
  json.url news_post_url(news_post, format: :json)
end
