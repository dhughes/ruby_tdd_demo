class Game

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

def score(total: 0, frame: 1, remaining_rolls: @rolls.dup)
  return total if remaining_rolls.size == 0 || frame > 10

  # get the number of pins for this roll
  pins = remaining_rolls.shift

  if is_strike(pins)
    # strike! add these pins and peek at the next two
    score(
      total: total + pins + remaining_rolls[0] + remaining_rolls[1],
      frame: frame + 1,
    remaining_rolls: remaining_rolls
    )
  elsif is_spare(pins, remaining_rolls[0])
    # spare! add two rolls and peak at the next one
    score(
      total: total + pins + remaining_rolls.shift + remaining_rolls[0],
      frame: frame + 1,
      remaining_rolls: remaining_rolls
    )
  else
    # it's a normal roll, just add two rolls
    score(
      total: total + pins + remaining_rolls.shift,
      frame: frame + 1,
      remaining_rolls: remaining_rolls
    )
  end
end

def is_spare(pins1, pins2)
  pins1 + pins2 == 10
end

def is_strike(pins)
  pins == 10
end
end
