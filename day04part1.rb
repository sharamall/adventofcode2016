class Room
  @chars
  @sector
  @checksum
  attr_accessor :chars, :sector, :checksum

  def initialize
    @chars = []
    @sector = 0
    @checksum = ""
  end
end

file = File.open "day04in.txt"
rooms = file.collect do |l|
  room = Room.new
  split = l.chomp.gsub("]", "").split("[")
  room.checksum = split[1]
  chars_and_sector = split[0].split "-"
  room.sector = chars_and_sector.pop.to_i
  room.chars = chars_and_sector.reduce(:+).split ""
  room
end
sum = 0
rooms.each do |r|
  counts = {}
  ('a'..'z').each { |c| counts[c.to_s] = 0 }
  r.chars.each do |c|
    counts[c.to_s] += 1
  end
  arr = []
  counts.each do |k, v|
    if v > 0
      arr << { char: k, count: v }
    end
  end
  arr.sort! do |a, b|
    res = b[:count] <=> a[:count]
    res = a[:char] <=> b[:char] if res == 0
    res
  end
  i = 0
  r.checksum.each_char do |char|
    break if char != arr[i][:char]
    i += 1
  end
  sum += r.sector if i == 5
end
puts sum