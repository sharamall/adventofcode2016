require 'digest'
base = "ojvtpuvg"
found = 0
i = 0
pw = "--------"
until found == 8
  digested = Digest::MD5.hexdigest base + i.to_s
  if digested.start_with?("00000") && digested[5].match(/[01234567]/) && pw[digested[5].to_i] == "-"
    puts "found at i = #{i}: #{digested}"
    found += 1
    pw[digested[5].to_i] = digested[6]
  end
  i += 1
end
puts pw