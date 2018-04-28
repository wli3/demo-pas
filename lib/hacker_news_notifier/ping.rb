require 'rest-client'

module HackerNewsNotifier
  class Ping
    def ping
      url = ''
      RestClient.post(url, {})
    end
  end
end
