require_relative "room"

class Hotel

  def initialize(name, capacity)
    @name = name
    @rooms = Hash.new(0)
      capacity.each {|k, v| @rooms[k] = Room.new(v)}
  end

  def name
    correct_name = ""
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(rm_name)
    @rooms.include?(rm_name)
  end

  def check_in(guest, rm_name)
    if room_exists?(rm_name)
      if @rooms[rm_name].add_occupant(guest)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    else
      puts "sorry, no existy"
    end
  end

  def has_vacancy?
    @rooms.values.any? {|cap| cap.available_space > 0}
  end

  def list_rooms
    @rooms.each do |rm_name, cap|
      puts  "#{rm_name} #{cap.available_space}"
    end
  end
end
