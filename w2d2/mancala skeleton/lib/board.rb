class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    place_stones
  end

  def place_stones
    @cups = Array.new(14) {[:stone, :stone, :stone, :stone]}
    @cups[6], @cups[13] = [], []
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 14)
  end

  def make_move(start_pos, current_player_name)
    stones_to_move = @cups[start_pos].count
    @cups[start_pos] = []

    case current_player_name
    when @player1
      opponents_store = 13
    when @player2
      opponents_store = 6
    else
      raise "Invalid player!"
    end

    current_index = start_pos
    until stones_to_move == 0
      current_index += 1
      current_index -= 14 if current_index >= 14

      next if current_index == opponents_store
      @cups[current_index] << :stone
      stones_to_move -= 1
    end

    render
    next_turn(current_index)
  end

  def next_turn(ending_cup_idx)
    case ending_cup_idx
    when 6, 13
      :prompt
    else
      if @cups[ending_cup_idx].size == 1
        :switch
      else
      ending_cup_idx
      end
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all? { |cup| @cups[cup].empty? } ||
        (7..12).all? { |cup| @cups[cup].empty? }
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 1
      @player1
    when 0
      :draw
    when -1
      @player2
    end
  end
end
