#!/usr/bin/env ruby
require '../utils'

NUMBERS = %w[one two three four five six seven eight nine]
TABLE = Hash[NUMBERS.zip((1..NUMBERS.size + 1).map(&:to_s))]

class String
  def translate(table)
    table.each { |k, v| self.sub!(k, v) }
    self
  end
end

def part1(data)
  data.map do |entry|
    entry.delete("^0-9").chars.values_at(0, -1).join.to_i
  end.sum
end

def part2(data)
  data.map do |entry|
    entry.scan(/(?=(#{TABLE.keys.join('|')}|\d))/)
         .flatten
         .values_at(0, -1)
         .map { |m| TABLE[m] || m }
         .join
         .to_i
  end.sum
end

data = ARGF.each_line.to_a
puts part1 data
puts part2 data
