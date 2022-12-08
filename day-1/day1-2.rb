# frozen_string_literal: true

# Day 1, Part 1
class Day1
  # read a file line by line ignoring blank lines
  def self.read_file(filename)
    array_of_elf_cals = [[]]
    File.readlines(filename).each do |line|
      line = line.strip
      if line.empty?
        array_of_elf_cals << []
        next
      end
      array_of_elf_cals.last << line.to_i
    end

    array_of_elf_cals
  end
end

calories_per_elf = Day1.read_file('example.txt')
p calories_per_elf.map(&:sum).sort.last(3).sum

calories_per_elf = Day1.read_file('input.txt')
p calories_per_elf.map(&:sum).sort.last(3).sum
