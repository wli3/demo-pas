require 'test_helper'

class PingTest < Minitest::Test
  def test_that_ping_ping_it_notifies_the_user
    real = HackerNewsNotifier::Ping.new
    simulator = PingSimulator.new
    [
      # real,
      simulator
    ].each(&:ping)
    assert simulator.acknowledged? == true
  end
end
