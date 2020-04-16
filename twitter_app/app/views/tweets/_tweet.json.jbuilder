json.extract! tweet, :id, :tweets, :created_at, :updated_at
json.url tweet_url(tweet, format: :json)
