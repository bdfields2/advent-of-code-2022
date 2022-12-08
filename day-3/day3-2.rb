# frozen_string_literal: true

require 'byebug'
class Day3
  def self.read_file(filename)
    file = File.open(filename, 'r')

    # read the file in 3 lines at a time
    file.each_slice(3).map do |lines|
      common_letter = lines.map { |line| line.strip.split('') }.reduce(:&).first
      hash[common_letter]
    end
  end

  def self.hash
    @@hash ||= generate_hash
  end

  # generate a hash of letters and their values
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
