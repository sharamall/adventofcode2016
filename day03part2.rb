file = File.open "day03in.txt"
$triangles = 0
in_lines = file.collect do |l|
  res = l.scan /\s*(\d+)\s*(\d+)\s*(\d+)\s*/
  x = res[0][0].to_i
  y = res[0][1].to_i
  z = res[0][2].to_i
  [x, y, z]
end

def tri_test(x, y, z)
  $triangles += 1 if x + y > z and x + z > y and y + z > x
end

in_lines.each_slice(3) do |s|
  tri_test(s[0][0], s[1][0], s[2][0])
  tri_test(s[0][1], s[1][1], s[2][1])
  tri_test(s[0][2], s[1][2], s[2][2])
end
puts $triangles