class Line
  attr_reader :outer_parts, :inner_parts

  def initialize
    @outer_parts = []
    @inner_parts = []
  end
end

file = File.open "day07in.txt"
lines = file.collect do |l|
  ln = Line.new
  inside = false
  part = ""
  l.each_char do |c|
    if inside
      if c == "]" or c == "\n"
        ln.inner_parts << part
        part = ""
        inside = false
      else
        part += c
      end
    else
      if c == "[" or c == "\n"
        ln.outer_parts << part
        part = ""
        inside = true
      else
        part += c
      end
    end
  end
  ln
end
file.close
supported = 0

def ssl_supported?(l)
  inner_matches = []
  l.inner_parts.each do |part|
    i = 2
    until i >= part.length
      inner_matches << "#{part[i - 2]}#{part[i - 1]}#{part[i - 0]}" if part[i - 2] == part[i] && part[i] != part[i - 1]
      i += 1
    end
  end
  l.outer_parts.each do |part|
    i = 2
    until i >= part.length
      if part[i - 2] == part[i] && part[i] != part[i - 1]
        return true if inner_matches.include? "#{part[i - 1]}#{part[i]}#{part[i - 1]}"
      end
      i += 1
    end
  end
  false
end

lines.each do |l|
  supported += 1 if ssl_supported? l
end
puts supported