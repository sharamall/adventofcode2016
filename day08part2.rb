f = File.open "day08in.txt"
max_x = 50
max_y = 6
grid = {}
max_x.times do |x|
  max_y.times do |y|
    grid[[x, y]] = "."
  end
end
f.each_line do |l|
  if l.start_with? "rect "
    m = l.match /rect (\d+)x(\d+)/
    m[1].to_i.times do |x|
      m[2].to_i.times do |y|
        grid[[x, y]] = "#"
      end
    end
  else
    m = l.match /rotate (\w+) .=(\d+) by (\d+)/
    changes = {}
    if m[1] == "column"
      x = m[2].to_i
      max_y.times do |y|
        changes[[x, y]] = grid[[x, (y - m[3].to_i) % max_y]]
      end
    else
      y = m[2].to_i
      max_x.times do |x|
        changes[[x, y]] = grid[[(x - m[3].to_i) % max_x, y]]
      end
    end
    changes.each { |k, v| grid[k] = v }
  end
end
max_y.times do |y|
  max_x.times do |x|
    print grid[[x, y]]
  end
  puts ""
end