require 'test_helper'

class TitleCheckerTest < Minitest::Test
  def test_check_exists_title_exists_in_top_500_it_raises
    assert_raises ArgumentError do
      sut = HackerNewsNotifier::TitleChecker.new
      sut.title_exists('Dumber phone', 501)
    end
  end

  def test_check_exists_title_exists_in_top_minus_1_it_raises
    assert_raises ArgumentError do
      sut = HackerNewsNotifier::TitleChecker.new
      sut.title_exists('Dumber phone', -1)
    end
  end

  def test_check_exists_title_exists_in_top_0_5_it_raises
    assert_raises ArgumentError do
      sut = HackerNewsNotifier::TitleChecker.new
      sut.title_exists('Dumber phone', 0.5)
    end
  end

  def test_check_non_exists_title_exists_in_top_10_it_returns_false
    sut = HackerNewsNotifier::TitleChecker.new
    assert sut.title_exists('non exists title', 10)
  end

  def test_check_exists_title_exists_in_top_10_it_returns_true
    sut = HackerNewsNotifier::TitleChecker.new
    assert sut.title_exists('Dumber phone', 10)
  end
end
