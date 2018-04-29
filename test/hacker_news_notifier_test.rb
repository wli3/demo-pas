require 'test_helper'
require 'minitest/stub_const'

class HackerNewsNotifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HackerNewsNotifier::VERSION
  end

  def test_that_notifies_the_user_when_input_title_is_in_hacker_news
    sut = HackerNewsNotifier::Notifier.new

    ping_simulator = PingSimulator.new

    give_ping_simulator = lambda {
      ping_simulator
    }

    HackerNewsNotifier.stub_const(:TitleChecker, TitleCheckerSimulator) do
      HackerNewsNotifier::Ping.stub(:new, give_ping_simulator) do
        sut.check 'Lessons learned from a failing local mall'
      end
    end

    assert ping_simulator.acknowledged? == true
  end

  def test_that_do_nothing_when_input_title_is_not_in_hacker_news
    sut = HackerNewsNotifier::Notifier.new

    ping_simulator = PingSimulator.new

    give_ping_simulator = lambda {
      ping_simulator
    }

    HackerNewsNotifier.stub_const(:TitleChecker, TitleCheckerSimulator) do
      HackerNewsNotifier::Ping.stub(:new, give_ping_simulator) do
        sut.check 'no on hacker news'
      end
    end

    assert_equal false, ping_simulator.acknowledged?
  end
end
