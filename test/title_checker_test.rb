require 'test_helper'

class TitleCheckerTest < Minitest::Test
  def test_check_non_exists_title_exists_in_top_10_it_returns_false
    sut = HackerNewsNotifier::TitleChecker.new
    assert sut.title_exists("non exists title", 10) == false
  end
end
