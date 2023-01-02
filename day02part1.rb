file = File.open "day02in.txt"
input = file.collect { |l| l.chomp.split "" }
result = []
x = 1
y = 1

input.each do |line|
  line.each do |c|
    if c == "R"
      x = [x + 1, 2].min
    elsif c == "L"
      x = [x - 1, 0].max
    elsif c == "U"
      y = [y - 1, 0].max
    elsif c == "D"
      y = [y + 1, 2].min
    end
  end
  result << [1, 2, 3, 4, 5, 6, 7, 8, 9][y * 3 + x]
end
puts result.inspect