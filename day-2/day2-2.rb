# frozen_string_literal: true

require 'byebug'

class Day2
  @@rules = { a: 1, b: 2, c: 3, x: 0, y: 3, z: 6 }
  ROCK = 1
  PAPER = 2
  SCISSORS = 3
  LOSE = 0
  DRAW = 3
  WIN = 6

  def self.read_file(filename)
    File.readlines(filename).map do |line|
      moves = line.split
      elf_move = @@rules[moves[0].downcase.to_sym]
      outcome = @@rules[moves[1].downcase.to_sym]

      score = outcome + my_move(elf_move, outcome)
      score
    end
  end

  def self.my_move(elf, outcome)
    if is_rock?(elf)
      if outcome == LOSE
        return SCISSORS
      elsif outcome == DRAW
        return ROCK
      elsif outcome == WIN
        return PAPER
      end
    end

    if is_paper?(elf)
      if outcome == LOSE
        return ROCK
      elsif outcome == DRAW
        return PAPER
      elsif outcome == WIN
        return SCISSORS
      end
    end

    if is_scissors?(elf)
      if outcome == LOSE
        return PAPER
      elsif outcome == DRAW
        return SCISSORS
      elsif outcome == WIN
        return ROCK
      end
    end
  end

  def self.is_rock?(value)
    value == ROCK
  end

  def self.is_paper?(value)
    value == PAPER
  end

  def self.is_scissors?(value)
    value == SCISSORS
  end
end

p Day2.read_file('example.txt').sum
p Day2.read_file('input.txt').sum
