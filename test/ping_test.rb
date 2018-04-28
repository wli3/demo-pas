require 'test_helper'

class PingTest < Minitest::Test
  def test_that_ping_ping_it_pings
    skip"No plain API in github so this will always fail"
    ping = UserNotifier::Ping.new
    assert ping.ping.code == 200
  end
end
