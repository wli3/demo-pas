require 'hacker_news_notifier/version'
require 'hacker_news_notifier/title_checker'
require 'hacker_news_notifier/ping'

module HackerNewsNotifier
  class Notifier
    def check(title)
      title_checker = TitleChecker.new
      ping = Ping.new
      ping.ping if title_checker.title_exists(title, 10)
    end
  end
end
