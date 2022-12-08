# frozen_string_literal: true

class Day3
  def self.read_file(filename)
    File.readlines(filename).map do |line|
      line = line.strip
      mid = line.length / 2
      left = line[0..mid - 1].split('')
      right = line[mid..-1].split('')
      hash[(left & right).first]
    end
  end

  def self.hash
    @@hash ||= generate_hash
  end

  def self.generate_hash
    hash = {}
    ('a'..'z').each_with_index do |letter, index|
      hash[letter] = index + 1
    end

    ('A'..'Z').each_with_index do |letter, index|
      hash[letter] = index + 27
    end

    hash
  end
end

p Day3.read_file('example.txt').sum
p Day3.read_file('input.txt').sum
