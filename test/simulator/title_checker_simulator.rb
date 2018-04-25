class TitleCheckerSimulator
  def title_exists(title, top)
    raise ArgumentError, 'Top max is 500' if top > 500
    if top <= 1 || !(top.is_a? Integer)
      raise ArgumentError, 'Top min is 1 and interger'
    end

    fake_list = (1..500).collect(&:to_s)
    fake_list[0] = 'Dumber phone'

    fake_list.first(top).each do |item|
      return true if item.include? title
    end

    false
  end
end
