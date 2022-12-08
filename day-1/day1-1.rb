# frozen_string_literal: true

# Day 1, Part 1
class Day1
  # read a file line by line ignoring blank lines
  def self.read_file(filename)
    array_of_elf_cals = [[]]
    File.readlines(filename).each do |line|
      line = line.strip

      # if line is empty, create a new array for the next elf and skip
      if line.empty?
        array_of_elf_cals << []
        next
      end

      # add the caloric value to the last array
      array_of_elf_cals.last << line.to_i
    end

    array_of_elf_cals
  end
end

calories_per_elf = Day1.read_file('example.txt')
p calories_per_elf.map(&:sum).max

calories_per_elf = Day1.read_file('input.txt')
p calories_per_elf.map(&:sum).max
