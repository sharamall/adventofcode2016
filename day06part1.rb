file = File.open "day06in.txt"
input = file.collect { |l| l.chomp.split "" }
input = input.transpose.reverse
most_common = []
input.each do |col|
  counts = {}
  max = [0, '']
  col.each do |c|
    counts[c] = 0 unless counts.key? c
    counts[c] += 1
    max = [counts[c], c] if counts[c] > max[0]
  end
  most_common << max[1]
end
puts most_common.reverse.join ""