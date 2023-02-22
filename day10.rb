class Bot
  @vals
  @moves
  @number

  attr_reader :vals, :moves, :number

  def initialize(number)
    @number = number
    @vals = []
    @moves = {}
  end
end

f = File.open "day10in.txt"
bots = {}
outputs = {}
to_compare = [17, 61]
f.each_line do |l|
  if l.start_with? "v"
    matches = l.match /value (\d+) goes to bot (\d+)/
    val = matches[1].to_i
    bot = matches[2].to_i
    bots[bot] = Bot.new(bot) unless bots.key? bot
    bots[bot].vals << val
  else
    matches = l.match /bot (\d+) gives low to (\w+) (\d+) and high to (\w+) (\d+)/
    bot = matches[1].to_i
    low_val = matches[3].to_i
    high_val = matches[5].to_i

    bots[bot] = Bot.new(bot) unless bots.key? bot
    bots[bot].moves[:low] = { to: low_val, type: matches[2] }
    bots[bot].moves[:high] = { to: high_val, type: matches[4] }
  end
end
cur_bot = bots.detect { |k, v| v.vals.length == 2 }
until cur_bot.nil?
  cur_bot = cur_bot[1]
  low, high = cur_bot.vals.sort
  low_move = cur_bot.moves[:low]
  high_move = cur_bot.moves[:high]
  if low_move[:type] == "output"
    outputs[low_move[:to]] = [] unless outputs.key? low_move[:to]
    outputs[low_move[:to]] << low
  else
    bots[low_move[:to]] = Bot.new(low_move[:to]) unless bots.key? low_move[:to]
    bots[low_move[:to]].vals << low
  end
  if high_move[:type] == "output"
    outputs[high_move[:to]] = [] unless outputs.key? high_move[:to]
    outputs[high_move[:to]] << high
  else
    bots[high_move[:to]] = Bot.new(high_move[:to]) unless bots.key? high_move[:to]
    bots[high_move[:to]].vals << high
  end
  cur_bot.vals.clear
  cur_bot = bots.detect { |k, v| v.vals.length == 2 }
  puts "part 1 #{cur_bot[1].number}" if !cur_bot.nil? && (cur_bot[1].vals - to_compare).empty?
end
puts "part 2 #{outputs[0][0] * outputs[1][0] * outputs[2][0]}"