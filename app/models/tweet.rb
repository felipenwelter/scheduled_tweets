class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maxium: 280 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 24.hours.from_now
  end

  def published?
    tweet_id?
  end

  def publish_to_twitter!
    tweet_text = Tweet.last.body
    tweet_params = { text: tweet_text }
    json_params = tweet_params.to_json
    result = twitter_account.client.post("tweets", json_params)
    update(tweet_id: result["data"]["id"])
  end

end