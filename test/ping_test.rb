require 'test_helper'

class PingTest < Minitest::Test
  def test_that_ping_ping_it_notifies_the_user
    real = UserNotifier::Ping.new
    simulator = PingSimulator.new
    [
        # real,
        simulator
    ].each do |sut|
      sut.ping
    end
    assert simulator.acknowledged? == true
  end
end
