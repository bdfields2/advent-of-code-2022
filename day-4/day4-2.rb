# frozen_string_literal: true

class Day4
  def self.read_file(filename)
    File.readlines(filename).map do |line|
      a, b = line.split(',')
      a = a.split('-').map(&:to_i)
      b = b.split('-').map(&:to_i)
      a = (a[0]..a[1])
      b = (b[0]..b[1])
      [a, b].map(&:to_a)
    end
  end
end

p Day4.read_file('example.txt').filter { |a, b| (a & b).any? }.count

p Day4.read_file('input.txt').filter { |a, b| (a & b).any? }.count
