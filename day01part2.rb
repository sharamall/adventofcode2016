def main(file)
  dirs = [:north, :east, :south, :west]
  x = 0
  y = 0
  seen = { "0_0" => "" }
  file.each_line do |l|
    res = l.scan /(\w)(\d+)(?:,\s)?/
    res.each do |match|
      turn = match[0]
      dist = match[1].to_i
      dirs.push dirs.shift if turn == "R"
      dirs.unshift dirs.pop if turn == "L"
      if [:north, :south].include? dirs[0]
        dist *= -1 if dirs[0] == :south
        dist.abs.times do
          y += dist <=> 0
          key = "#{x}_#{y}"
          if seen.key? key
            puts x.abs + y.abs
            return
          else
            seen[key] = ""
          end
        end
      else
        dist *= -1 if dirs[0] == :west
        dist.abs.times do
          x += dist <=> 0
          key = "#{x}_#{y}"
          if seen.key? key
            puts x.abs + y.abs
            return
          else
            seen[key] = ""
          end
        end
      end
    end
  end
end

file = File.open "day01in.txt"
main file
file.close