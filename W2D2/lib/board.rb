require 'byebug'
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2

    @cups = self.place_stones
  end

  def place_stones
    cups = Array.new(14) { Array.new(4) { :stone  } }
    cups[6], cups[13] = [], []
    cups
  end

  def valid_move?(start_pos)
    if start_pos > 13
      raise StandardError.new("Invalid starting cup")
    end

  end

  def make_move(start_pos, current_player_name)
    debugger
    stones = self.cups[start_pos].dup
    self.cups[start_pos] = []
    i = start_pos
    while stones.size >= 1
      i += 1
      next if i == 13
      @cups[i] << [stones.pop]
    end
    render
    next_turn(i)
    i
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? { |el| el.empty? } || @cups[7..12].all? { |el| el.empty? }
      return true
    end
    false
  end

  def winner
    if @cups[6].size > @cups[13].size
      return @name1
    elsif @cups[6].size < @cups[13].size
      return @name2
    else
      return :draw
    end
  end

end
