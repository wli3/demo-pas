class PingSimulator

  def initialize
      @acknowledged = false
  end

  def ping
    @acknowledged = true
  end

  def acknowledged?
    @acknowledged
  end
end
