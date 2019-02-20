class Room

  def initialize(cap_num)
    @capacity = cap_num
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    if @occupants.length < @capacity
      return false
    else @occupants == @capacity
      return true
    end
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(name)
      if self.full?
        p "No room for you!"
        return false
      else
        @occupants << name
        p "there is room"
      end
      return true
    end
end
