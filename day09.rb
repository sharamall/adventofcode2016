def decompress(str, recursive = false)
  decompressed_length = 0
  i = 0
  until i == str.length
    c = str[i]
    if c == "("
      temp = ""
      until c == "x"
        i += 1
        c = str[i]
        temp += c
      end
      num_chars = temp[..-2].to_i
      temp = ""
      until c == ")"
        i += 1
        c = str[i]
        temp += c
      end
      i += 1
      num_repeats = temp[..-2].to_i
      substr = str[i...(i + num_chars)]
      if recursive
        decompressed_length += decompress(substr, true) * num_repeats
      else
        decompressed_length += substr.length * num_repeats
      end
      i += num_chars
    else
      decompressed_length += 1
      i += 1
    end
  end
  decompressed_length
end

f = File.open "day09in.txt"
f.each_line do |l|
  puts "part1: #{decompress(l)}"
  puts "part2: #{decompress(l, true)}"
end
f.close