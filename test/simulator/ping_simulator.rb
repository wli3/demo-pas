class PingSimulator

  @acknowledged = false

  def ping
    @acknowledged = true
  end

  def acknowledged?
    return @acknowledged
  end
end
