file = File.open "day03in.txt"
triangles = 0
file.each_line do |l|
  res = l.scan /\s*(\d+)\s*(\d+)\s*(\d+)\s*/
  x = res[0][0].to_i
  y = res[0][1].to_i
  z = res[0][2].to_i
  triangles += 1 if x + y > z and x + z > y and y + z > x
end
puts triangles