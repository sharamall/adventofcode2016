file = File.open "day06in.txt"
input = file.collect { |l| l.chomp.split "" }
input = input.transpose.reverse
least_common = []
input.each do |col|
  counts = {}
  min = [1e10, '']
  col.each do |c|
    counts[c] = 0 unless counts.key? c
    counts[c] += 1
  end
  counts.each do |k, v|
    min = [v, k] if v < min[0]
  end
  least_common << min[1]
end
puts least_common.reverse.join ""