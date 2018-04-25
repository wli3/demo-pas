require 'rest-client'
require 'json'

module HackerNewsNotifier
  class TitleChecker
    def title_exists(title, top)
      raise ArgumentError, 'Top max is 500' if top > 500
      if top <= 1 || !(top.is_a? Integer)
        raise ArgumentError, 'Top min is 1 and interger'
      end

      url = 'https://hacker-news.firebaseio.com/v0/topstories.json'
      response = RestClient.get(url)
      paresed = JSON.parse(response).first top

      paresed.each do |item_id|
        item_url = "https://hacker-news.firebaseio.com/v0/item/#{item_id}.json"
        item_response = RestClient.get(item_url)
        return true if JSON.parse(item_response)['title'].include? title
      end

      false
    end
  end
end
