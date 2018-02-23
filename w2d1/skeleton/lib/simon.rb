require 'byebug'
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    system("clear")

    show_sequence
    check(require_sequence)

    unless game_over
      round_success_message
      add_random_color
      self.sequence_length += 1
      sleep(3)
    end
  end

  def show_sequence
    add_random_color
    puts seq
    sleep(3)
    system("clear")
  end

  def check(guess)
    if guess != seq
      self.game_over = true
    end
  end

  def require_sequence
    puts "enter a guess"
    gets.chomp.split
  end

  def add_random_color
    self.seq = seq + [COLORS.sample]
  end

  def round_success_message
    puts seq
    puts "correct!"
  end

  def game_over_message
    puts 'gg ttho'
  end

  def reset_game
    @seq = []
    @sequence_length = 1
    @game_over = false
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "hi"
  Simon.new.play
end
