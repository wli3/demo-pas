require 'rest-client'

module UserNotifier
  class Ping
    def ping
      url = ''
      RestClient.post(url, {})
    end
  end
end
