class Network
  attr_reader :name

  def initialize(name)
    @name = name
    @shows = []
  end
end
