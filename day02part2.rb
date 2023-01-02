file = File.open "day02in.txt"
input = file.collect { |l| l.chomp.split "" }
result = []
x = 0
y = 2

input.each do |line|
  line.each do |c|
    if c == "R"
      x = [x + 1, 4 - (2 - y).abs].min
    elsif c == "L"
      x = [x - 1, (2 - y).abs].max
    elsif c == "U"
      y = [y - 1, (2 - x).abs].max
    elsif c == "D"
      y = [y + 1, 4 - (2 - x).abs].min
    end
  end
  result << [nil, nil, 1, nil, nil, nil, 2, 3, 4, nil, 5, 6, 7, 8, 9, nil, "A", "B", "C", nil, nil, nil, "D", nil, nil][y * 5 + x]
end
puts result.inspect