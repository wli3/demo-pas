require 'test_helper'

class TitleCheckerTest < Minitest::Test
  def test_check_non_exists_title_exists_in_top_10_it_returns_false
    sut = HackerNewsNotifier::TitleChecker.new
    assert sut.title_exists("non exists title", 10) == false
  end

  def test_check_exists_title_exists_in_top_10_it_returns_true
    sut = HackerNewsNotifier::TitleChecker.new
    assert sut.title_exists("Dumber phone", 10) == true
  end

end
