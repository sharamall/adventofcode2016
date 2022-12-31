file = File.open "day01in.txt"
dirs = [:north, :east, :south, :west]
x = 0
y = 0
file.each_line do |l|
  res = l.scan /(\w)(\d+)(?:,\s)?/
  res.each do |match|
    turn = match[0]
    dist = match[1].to_i
    dirs.push dirs.shift if turn == "R"
    dirs.unshift dirs.pop if turn == "L"
    if [:north, :south].include? dirs[0]
      dist *= -1 if dirs[0] == :south
      y += dist
    else
      dist *= -1 if dirs[0] == :west
      x += dist
    end
  end
end
file.close
puts x.abs + y.abs
