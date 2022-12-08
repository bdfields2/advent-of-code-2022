# frozen_string_literal: true

require 'byebug'

class Day2
  @@rules = { a: 1, b: 2, c: 3, x: 1, y: 2, z: 3 }
  ROCK = 1
  PAPER = 2
  SCISSORS = 3

  def self.read_file(filename)
    File.readlines(filename).map do |line|
      moves = line.split
      elf_move = @@rules[moves[0].downcase.to_sym]
      my_move = @@rules[moves[1].downcase.to_sym]

      score = my_move + outcome(elf_move, my_move)

      score
    end
  end

  def self.outcome(elf, me)
    if is_rock?(elf)
      if is_rock?(me)
        return 3
      elsif is_paper?(me)
        return 6
      elsif is_scissors?(me)
        return 0
      end
    end

    if is_paper?(elf)
      if is_rock?(me)
        return 0
      elsif is_paper?(me)
        return 3
      elsif is_scissors?(me)
        return 6
      end
    end

    if is_scissors?(elf)
      if is_rock?(me)
        return 6
      elsif is_paper?(me)
        return 0
      elsif is_scissors?(me)
        return 3
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
