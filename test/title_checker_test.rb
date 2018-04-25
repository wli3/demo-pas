require 'test_helper'

class TitleCheckerTest < Minitest::Test
  def test_check_exists_title_exists_in_top_500_it_raises
    real = HackerNewsNotifier::TitleChecker.new
    simulator = TitleCheckerSimulator.new
    [real, simulator].each do |sut|
      assert_raises ArgumentError do
        sut.title_exists('Dumber phone', 501)
      end
    end
  end

  def test_check_exists_title_exists_in_top_minus_1_it_raises
    real = HackerNewsNotifier::TitleChecker.new
    simulator = TitleCheckerSimulator.new
    [real, simulator].each do |sut|
      assert_raises ArgumentError do
        sut.title_exists('Dumber phone', -1)
      end
    end
  end

  def test_check_exists_title_exists_in_top_0_5_it_raises
    real = HackerNewsNotifier::TitleChecker.new
    simulator = TitleCheckerSimulator.new
    [real, simulator].each do |sut|
      assert_raises ArgumentError do
        sut.title_exists('Dumber phone', 0.5)
      end
    end
  end

  def test_check_non_exists_title_exists_in_top_10_it_returns_false
    real = HackerNewsNotifier::TitleChecker.new
    simulator = TitleCheckerSimulator.new
    [real, simulator].each do |sut|
      assert sut.title_exists('non exists title', 10) == false
    end
  end

  def test_check_exists_title_exists_in_top_10_it_returns_true
    real = HackerNewsNotifier::TitleChecker.new
    simulator = TitleCheckerSimulator.new
    [real, simulator].each do |sut|
      assert sut.title_exists('Dumber phone', 10) == true
    end
  end
end
