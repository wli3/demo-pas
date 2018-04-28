class PingSimulator
  @acknowledged = false

  def ping
    @acknowledged = true
  end

  def acknowledged?
    @acknowledged
  end
end
