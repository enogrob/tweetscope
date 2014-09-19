class Keyword < ActiveRecord::Base
  def grab_twitts
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ST1CRtzugWWt9arauxHmZqAXV"
      config.consumer_secret     = "lCLIJYed5PGDe7vuxBVqTQVn2ewdiuRNhVz4cgFR2mfGqbENi9"
      config.access_token        = "14048426-8yVSdMaY0lkMqLDbQNYA6XdKcROWhLNRv3KS19fh9"
      config.access_token_secret = "0Tdg4HmXKLnnpur8OngPnnWQB5PIAg50Eik9paqXkmJhZ"
    end

    client.search(self.word, :result_type => "recent").take(3).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
