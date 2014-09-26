class Keyword < ActiveRecord::Base
  has_many :tweets

  def grab_twitts
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ST1CRtzugWWt9arauxHmZqAXV"
      config.consumer_secret     = "lCLIJYed5PGDe7vuxBVqTQVn2ewdiuRNhVz4cgFR2mfGqbENi9"
      config.access_token        = "14048426-8yVSdMaY0lkMqLDbQNYA6XdKcROWhLNRv3KS19fh9"
      config.access_token_secret = "0Tdg4HmXKLnnpur8OngPnnWQB5PIAg50Eik9paqXkmJhZ"
    end

    client.search(self.word, :count => 10, :result_type => "recent").take(10).collect do |tweet|
      new_tweet = Tweet.new
      new_tweet.tweet_id=tweet.id.to_s
      new_tweet.tweet_created_at=tweet.created_at
      new_tweet.text = tweet.text

      new_tweet.user_uid = tweet.user.id
      new_tweet.user_name = tweet.user.name
      new_tweet.user_screen_name = tweet.user.screen_name
      # new_tweet.user_uid = twwet.user.profile_image_url
      new_tweet.keyword = self
      new_tweet.save
    end
  end
end
